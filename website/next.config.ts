import type { NextConfig } from "next";

const nextConfig: NextConfig = {
    webpack(config) {
        config.resolve.fallback = {
            ...config.resolve.fallback,
            fs: false,
        };
        return config;
    },
    images: {
        remotePatterns: [
        {
            protocol: "https",
            hostname: "raw.githubusercontent.com",
            pathname: "/**",
        },
        ],
    },
    env: {
        NEXT_PUBLIC_SITE_URL: "https://instafel.app",
    },
    redirects: async () => {
        return [
            { source: "/home", destination: "/", permanent: true },
            { source: "/guide", destination: "/wiki", permanent: true },
            { source: "/guides", destination: "/wiki", permanent: true },
            { source: "/library_backup", destination: "/library/backup", permanent: true },
            { source: "/library_flag", destination: "/library/flag", permanent: true },
            { source: "/flag", destination: "/library/flag/view", permanent: true },
            { source: "/backup", destination: "/library/backup/view", permanent: true }
        ];
    },
};

export default nextConfig;
