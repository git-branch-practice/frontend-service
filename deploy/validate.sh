#!/bin/bash
echo "🩺 헬스체크 중..."

# Next.js 서버 헬스체크 (필요에 따라 변경 가능)
curl -fs http://localhost:3000/ || {
echo "헬스체크 실패"
exit 1
}

echo "헬스체크 성공"
