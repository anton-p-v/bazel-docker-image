# syntax=docker/dockerfile:1

FROM ubuntu:22.04

WORKDIR /bazel/workspace

RUN <<EOF
apt-get update
apt-get install --yes \
  g++ \
  unzip \
  zip
EOF

ARG BAZEL_VERSION=8.2.1
ARG BAZEL_SHA256=7ff2b6a675b59a791d007c526977d5262ade8fa52efc8e0d1ff9e18859909fc0

ADD \
  --checksum=sha256:${BAZEL_SHA256} \
  --chown=root:root \
  --chmod=755 \
  https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-linux-x86_64 \
  /usr/local/bin/bazel

ENTRYPOINT [ "/usr/local/bin/bazel" ]
