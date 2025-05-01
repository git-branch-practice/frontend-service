#!/bin/bash
echo "프론트 서버 시작 중..."

# PM2로 실행
pm2 start npm --name frontend-service -- start

# PM2 상태 저장
pm2 save

echo "프론트 서버 실행 완료"
