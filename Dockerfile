FROM ubuntu:xenial

# Install packages
RUN apt-get update && apt-get install -y \
  build-essential \
  curl \
  libpq-dev \
  libssl-dev \
  pkg-config

# Install Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

# Build
WORKDIR /src
ENTRYPOINT \
  ~/.cargo/bin/cargo build --verbose --release && \
  ~/.cargo/bin/cargo test --verbose --release