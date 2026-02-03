# 📘 Jupyter + MLflow Docker Environment

수업 및 개인 실험용으로 사용하는  
**Jupyter Lab + MLflow UI를 하나의 Docker 컨테이너로 실행**하는 환경입니다.

- Docker / docker-compose 기반
- requirements.txt 기반 자동 의존성 설치
- Jupyter Lab + MLflow UI 동시 실행
- 로컬 볼륨으로 MLflow 실험 로그 영구 저장

## 🧱 구성 개요

- **Jupyter Lab**
  - 포트: `9000`
- **MLflow UI**
  - 컨테이너 내부 포트: `5000`
  - 로컬 접근 포트: `5000`
  - macos: `5001`
- **Python**
  - Base image: `python:3.11-slim`
- **실험 로그**
  - `./mlruns` 디렉토리에 저장

## 📁 디렉토리 구조

```text
.
├── Dockerfile
├── docker-compose.yml
├── requirements.txt
├── mlruns/                 # MLflow 실험 로그 (자동 생성)
├── .env                    # Jupyter 비밀번호 (gitignore 권장)
└── README.md
