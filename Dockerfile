FROM debian:stable-slim as get

WORKDIR /bun

RUN apt-get update
RUN apt-get install curl unzip -y
RUN curl --fail --location --progress-bar --output "/bun/bun.zip" "https://github.com/oven-sh/bun/releases/latest/download/bun-linux-x64.zip"
RUN unzip -d /bun -q -o "/bun/bun.zip"
RUN mv /bun/bun-linux-x64/bun /usr/local/bin/bun
RUN chmod 777 /usr/local/bin/bun

FROM debian:stable-slim
COPY --from=get /usr/local/bin/bun /bin/bun
RUN ln -s /bin/bun /bin/bunx && chmod 777 /bin/bunx
WORKDIR /app
ADD http.js /app/http.js

CMD ["bun", "run", "/app/http.js"]
