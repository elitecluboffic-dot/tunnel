FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl

RUN curl -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 \
    -o /usr/local/bin/cloudflared && \
    chmod +x /usr/local/bin/cloudflared

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
