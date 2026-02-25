ARG SUPERVISOR_VERSION=2026.02.2
FROM ghcr.io/home-assistant/aarch64-hassio-supervisor:${SUPERVISOR_VERSION}
RUN sed -i 's|https://version.home-assistant.io/|https://lovely-him.github.io/version/|g' \
    /usr/src/supervisor/supervisor/const.py && \
    sed -i 's|ghcr.io/home-assistant/{self.sys_machine}-homeassistant|ghcr.io/lovely-him/{self.sys_machine}-homeassistant|g' \
    /usr/src/supervisor/supervisor/homeassistant/module.py && \
    python3 -c "\
import json; \
f='/usr/src/supervisor/supervisor/data/arch.json'; \
d=json.load(open(f)); \
d['orangepi3b']=['aarch64','armv7','armhf']; \
json.dump(d,open(f,'w')) \
"
