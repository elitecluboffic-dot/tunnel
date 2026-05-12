FROM ubuntu:22.04

RUN apt-get update && apt-get install -y curl gnupg

RUN curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

RUN echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ jammy main" | tee /etc/apt/sources.list.d/cloudflare-client.list

RUN apt-get update && apt-get install -y cloudflare-warp

RUN sysctl -w net.ipv4.ip_forward=1 || true

CMD warp-cli --accept-tos connector new $TOKEN && warp-cli connect && tail -f /dev/null
