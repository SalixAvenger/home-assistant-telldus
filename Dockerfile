FROM homeassistant/home-assistant:2022.10
LABEL maintainer="99nvbjed <yourmom@saysyes.com>"

# Install some dependencies and utils
RUN apk add --update \
  bash \
  curl \
  supervisor

# telldusd is already included in the official base image

# Install and configure Supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]

# Specify health check for Docker
HEALTHCHECK CMD curl --fail http://localhost:8123 || exit 1