# hassio-supervisor-custom

Patched HA Supervisor with custom version endpoint for Orange Pi 3B.

## 原理

基于 HA 官方 Supervisor 镜像，仅修改一处：将版本查询 URL 从 `version.home-assistant.io` 替换为 `lovely-him.github.io/version/`。这样 Supervisor 运行时会从自有端点获取更新信息。

## Dockerfile

```dockerfile
ARG SUPERVISOR_VERSION=2026.02.2
FROM ghcr.io/home-assistant/aarch64-hassio-supervisor:${SUPERVISOR_VERSION}
RUN sed -i 's|https://version.home-assistant.io/|https://lovely-him.github.io/version/|g' \
    /usr/src/supervisor/supervisor/const.py
```

## 使用方法

1. 打开 [Actions](../../actions) 页面
2. 选择 "Build Supervisor"
3. 填写 `supervisor_version`（如 `2026.02.2`）
4. 等待构建完成

构建产物推送到 `ghcr.io/lovely-him/aarch64-hassio-supervisor`。
