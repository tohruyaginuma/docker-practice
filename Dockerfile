FROM node:20-alpine
WORKDIR /app
RUN corepack enable
COPY my-app/package.json my-app/pnpm-lock.yaml ./
RUN pnpm i --frozen-lockfile
COPY my-app ./
RUN pnpm build
EXPOSE 3000
CMD ["pnpm", "start", "-p", "3000"]

