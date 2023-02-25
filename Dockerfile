FROM debian:stable-slim
COPY --from=oven/bun /usr/local/bin/bun /bin/bun
WORKDIR /app
ADD http.js /app/http.js

CMD ["bun", "run", "/app/http.js"]