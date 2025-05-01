#!/bin/bash
echo "PM2 프로세스 중지 중..."

# 기존 프로세스 종료
pm2 delete frontend-service || true

echo "프로세스 종료 완료"
