FROM ubuntu:18.04

ENV PROXY_PORT 8080

RUN apt update && apt install -y --no-install-recommends \
    wget squid iproute2 && \
    rm -rf /var/lib/apt/lists/*

ADD startup /squid/startup
RUN chmod +x /squid/startup
WORKDIR /squid
CMD ["bash", "/squid/startup"]
EXPOSE 8080
