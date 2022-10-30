ARG BUILD_FROM=ghcr.io/hassio-addons/base/aarch64:10.0.1
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Setup base
ARG BUILD_ARCH=aarch64
ARG PORT_VERSION=2.15.1
ENV VERSION=${PORT_VERSION}
RUN \
    if [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; fi \
    && if [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm"; fi \
    && if [ "${BUILD_ARCH}" = "amd64" ]; then ARCH="amd64"; fi \
    \
    && curl -L -s \
        "https://github.com/portainer/portainer/releases/download/${VERSION}/portainer-${VERSION}-linux-${ARCH}.tar.gz" \
        | tar zxvf - -C /opt/

# Copy root filesystem
COPY rootfs /

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Portainer ${PORT_VERSION}" \
    io.hass.description="Manage your Docker environment with ease" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
#    maintainer="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.title="Portainer" \
    org.opencontainers.image.description="Manage your Docker environment with ease" \
    org.opencontainers.image.vendor="Fork of DISCONTINUED Home Assistant Community Add-ons" \
#    org.opencontainers.image.authors="Franck Nijhof <frenck@addons.community>" \
    org.opencontainers.image.licenses="MIT" \
#    org.opencontainers.image.url="https://addons.community" \
    org.opencontainers.image.source="https://github.com/PascalKern/addon-portainer" \
    org.opencontainers.image.documentation="https://github.com/PascalKern/addon-portainer/blob/master/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
