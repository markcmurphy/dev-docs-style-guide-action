FROM node:current-alpine

ENV REVIEWDOG_VERSION=v0.11.0

SHELL ["/bin/ash", "-eo", "pipefail", "-c"]

# hadolint ignore=DL3006
RUN apk --no-cache add git

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}
# TODO: try pretty-reporter - RUN npm install -g markcmurphy/quality-docs-fork#pretty-reporter --save
RUN npm install -g markcmurphy/quality-docs-fork --save

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
