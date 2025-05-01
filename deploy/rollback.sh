#!/bin/bash
echo "⏪ 롤백 시작..."

# 이전 .next 복구
rm -rf .next
mv .next-prev .next

# 재시작
./stop.sh
./start.sh

echo "✅ 롤백 완료"
