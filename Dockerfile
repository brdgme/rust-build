FROM ubuntu:xenial

# Install packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  libssl-dev \
  pkg-config

# Build
WORKDIR /src
ENTRYPOINT curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly && \
  ~/.cargo/bin/cargo build --verbose --release && \
  ~/.cargo/bin/cargo test --verbose --release