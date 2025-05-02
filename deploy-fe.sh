#!/bin/bash
set -euo pipefail

echo "🚀 [START] 프론트엔드 서비스(Next.js) 배포 시작"

# === [0] 설정 ===
ROOT_DIR="$HOME/frontend-service"
REPO_URL="https://github.com/git-branch-practice/frontend-service.git"
BRANCH="develop"
SERVICE_NAME="frontend-service"
PORT=3000

# === [1] 작업 디렉토리로 이동 ===
echo "📁 작업 디렉토리 이동: $HOME"
cd "$HOME"

# === [2] 기존 디렉토리 삭제 ===
if [ -d "$SERVICE_NAME" ]; then
  echo "🧹 기존 $SERVICE_NAME 디렉토리 삭제"
  rm -rf "$SERVICE_NAME"
fi

# === [3] 최신 소스 클론 ===
echo "📥 소스 클론 중..."
git clone -b "$BRANCH" "$REPO_URL"

cd "$SERVICE_NAME"

# === [4] 기존 PM2 프로세스 종료 ===
echo "🛑 기존 PM2 프로세스 종료: $SERVICE_NAME"
pm2 delete "$SERVICE_NAME" || true

# === [5] 의존성 설치 ===
echo "📦 의존성 설치 중..."
npm ci

# === [6] 빌드 ===
echo "🏗️ 빌드 중..."
npm run build

# === [7] PM2로 Next.js 실행 ===
echo "🚦 PM2로 Next.js 실행: $SERVICE_NAME"
pm2 start npm \
  --name "$SERVICE_NAME" \
  -- start

# === [8] PM2 상태 저장 및 확인 ===
pm2 save
pm2 status

echo "✅ [DONE] 프론트엔드 서비스 배포 완료: http://localhost:$PORT"
