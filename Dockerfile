FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl gnupg iproute2

RUN curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ jammy main" | tee /etc/apt/sources.list.d/cloudflare-client.list

RUN apt-get update && apt-get install -y cloudflare-warp

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
