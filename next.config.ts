import type { NextConfig } from "next";

const nextConfig: NextConfig = {
    eslint: {
        ignoreDuringBuilds: true,
    },
    // 다른 config 옵션도 여기에 추가 가능
};

export default nextConfig;
