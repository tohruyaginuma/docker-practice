# ---- deps ----
FROM node:20-alpine AS deps
WORKDIR /app
RUN corepack enable
# lockfile を必ずコピー
COPY my-app/package.json my-app/pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# ---- build ----
FROM node:20-alpine AS builder
WORKDIR /app
ENV NEXT_TELEMETRY_DISABLED=1
RUN corepack enable
COPY --from=deps /app/node_modules ./node_modules
# プロジェクトの中身は my-app/ から丸ごとコピー
COPY my-app/ ./
RUN pnpm build && pnpm prune --prod

# ---- run ----
FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV PORT=3000
# pnpm を使うなら corepack 有効化
RUN corepack enable
# 必要物だけコピー
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
CMD ["pnpm","start"]          # package.json: "start": "next start -p 3000"