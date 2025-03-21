FROM node:22-bookworm

RUN npm install -g pnpm@latest-10 forever
WORKDIR /usr/src/app
COPY . .
RUN pnpm i
RUN pnpm build
RUN pnpm serve
RUN pnpm playwright install chromium --only-shell --with-deps
# RUN pnpm render

EXPOSE 3000

CMD ["sh"]