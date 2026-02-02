FROM python:3.11-slim

# 시스템 패키지 (ML / DB / graphviz 등)
RUN apt-get update && apt-get install -y \
    build-essential \
    default-libmysqlclient-dev \
    graphviz \
    curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

# requirements 먼저 복사 (캐시 유지)
COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# 나머지 파일 복사
COPY . .

# Jupyter + MLflow 포트(윈도우 환경인 경우: 5000번 사용)
# EXPOSE 9000 5000
EXPOSE 9000 5001

# MLflow 백그라운드 + Jupyter 포그라운드(윈도우 환경인 경우: 5000번 사용)
# CMD ["bash", "-lc", "mlflow ui --host 0.0.0.0 --port 5000 --backend-store-uri /mlruns & jupyter lab --ip=0.0.0.0 --allow-root --port 9000"]
CMD ["bash", "-lc", "mlflow ui --host 0.0.0.0 --port 5001 --backend-store-uri /mlruns & jupyter lab --ip=0.0.0.0 --allow-root --port 9000"]