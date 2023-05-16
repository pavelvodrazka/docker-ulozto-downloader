FROM debian:stable-slim as base

FROM base as builder

ENV PATH="/app/bin:$PATH"

RUN \
    apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv && \
    python3 -m venv /app && \
    pip install ulozto-downloader[auto-captcha]==3.3.1 && \
    pip uninstall -y setuptools pip

FROM base

COPY --from=builder /app /app
ENV PATH="/app/bin:$PATH"

RUN \
    apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends \
        tor \
        python3 && \
    rm -rf /var/lib/apt/lists/*

VOLUME /downloads
WORKDIR /downloads

ENTRYPOINT [ "ulozto-downloader", "--auto-captcha" ]
