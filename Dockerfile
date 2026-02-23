ARG SUPERVISOR_VERSION=2026.02.2
FROM ghcr.io/home-assistant/aarch64-hassio-supervisor:${SUPERVISOR_VERSION}
RUN sed -i 's|https://version.home-assistant.io/|https://lovely-him.github.io/version/|g' \
    /usr/src/supervisor/supervisor/const.py
