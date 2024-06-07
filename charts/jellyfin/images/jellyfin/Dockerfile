# NOTE: this short builder is made to enable the use of the `add-apt-repository` command
#       without having to install the `software-properties-common` package in the final image
#       (too much overhead for a single command)
FROM docker.io/library/ubuntu:jammy as enable_universe

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get install software-properties-common --assume-yes --no-install-recommends \
    && add-apt-repository universe


FROM docker.io/library/ubuntu:jammy

# renovate: datasource=github-releases depName=jellyfin/jellyfin versioning=semver extractVersion=^v(?<version>\S+)
ARG JELLYFIN_VERSION=10.8.13

# Add build arguments for specific architectures
ARG TARGETPLATFORM

ENV NVIDIA_DRIVER_CAPABILITIES="compute,video,utility"

# hadolint ignore=DL3008
RUN apt-get update \
    && apt-get upgrade --assume-yes --no-install-recommends \
    && apt-get install --assume-yes --no-install-recommends ca-certificates \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY --from=enable_universe /etc/apt/sources.list /etc/apt/sources.list
COPY jellyfin_team.gpg /etc/apt/keyrings/jellyfin_team.gpg
COPY jellyfin.sources /etc/apt/sources.list.d/jellyfin.sources

# hadolint ignore=DL3008
RUN groupadd jellyfin --gid 64710 \
    && useradd jellyfin --uid 64710 --gid 64710 \
      --system --no-create-home --shell /bin/false \
      --comment "Jellyfin default user" \
    \
    && sed "s/@RELEASE_NAME/$(awk -F'=' '/^VERSION_CODENAME=/{ print $NF }' /etc/os-release)/1" /etc/apt/sources.list.d/jellyfin.sources --in-place \
    && sed "s/@ARCH/$(dpkg --print-architecture)/1" /etc/apt/sources.list.d/jellyfin.sources --in-place \
    && apt-get update \
    \
    && apt-get install --assume-yes --no-install-recommends \
      jellyfin="${JELLYFIN_VERSION}*" \
      mesa-va-drivers \
    && if [ "$TARGETPLATFORM" = "linux/amd64" ]; then \
      apt-get install --assume-yes --no-install-recommends intel-opencl-icd \
    ; fi \
    && ln -s /usr/share/jellyfin-ffmpeg/ff* /usr/bin \
    && ln -s /usr/share/jellyfin-ffmpeg/vainfo /usr/bin \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* \
    \
    && mkdir -p /opt/jellyfin/cache /opt/jellyfin/config /opt/jellyfin/data /opt/jellyfin/log \
    && chown jellyfin:jellyfin --recursive /opt/jellyfin

ENV JELLYFIN_CACHE_DIR="/opt/jellyfin/cache"
ENV JELLYFIN_CONFIG_DIR="/opt/jellyfin/config"
ENV JELLYFIN_DATA_DIR="/opt/jellyfin/data"
ENV JELLYFIN_LOG_DIR="/opt/jellyfin/log"
ENV JELLYFIN_WEB_DIR="/usr/share/jellyfin/web"

ENTRYPOINT ["jellyfin"]
EXPOSE 8096
USER jellyfin
VOLUME /opt/jellyfin/config
VOLUME /opt/jellyfin/data

LABEL org.opencontainers.image.authors="Beluga-Cloud <xunleii@users.noreply.github.com>"
LABEL org.opencontainers.image.created="01/01/1970T00:00:00.000"
LABEL org.opencontainers.image.description="Jellyfin is the volunteer-built media solution that puts you in control of your media."
LABEL org.opencontainers.image.documentation="https://jellyfin.org/docs/"
LABEL org.opencontainers.image.licenses="GPL-2.0"
LABEL org.opencontainers.image.revision=""
LABEL org.opencontainers.image.source=""
LABEL org.opencontainers.image.title="jellyfin"
LABEL org.opencontainers.image.url="https://github.com/beluga-cloud/charts"
LABEL org.opencontainers.image.version=${JELLYFIN_VERSION}

LABEL com.github.beluga-cloud.ci.workflow.url=""
LABEL com.github.beluga-cloud.origin.authors="jellyfin <jellyfin.org>"
LABEL com.github.beluga-cloud.origin.licenses="GPL-2.0"
LABEL com.github.beluga-cloud.origin.source="https://github.com/jellyfin/jellyfin"
