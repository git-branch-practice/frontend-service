#!/bin/bash
set -e

echo "==== 프론트엔드 배포 시작 ===="
# 실행 중인 프로세스 중단
echo "🛑 기존 프론트 PM2 프로세스 종료..."
pm2 delete frontend-service || true

# 의존성 설치 및 빌드
echo "📦 npm install 중..."
npm install

echo "🏗️ npm build 중..."
npm run build

# 서버 실행
echo "🚀 프론트 서버 실행 중..."
pm2 start npm --name frontend-service -- start

# 상태 저장 및 확인
pm2 save
pm2 status

echo "✅ 프론트엔드 배포 완료"
# 더미1