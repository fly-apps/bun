FROM debian:stable-slim
ADD bin/bun /bin/bun
WORKDIR /app
ADD http.js /app/http.js

CMD ["bun", "run", "/app/http.js"]