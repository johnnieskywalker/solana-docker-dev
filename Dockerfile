FROM node

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
    ca-certificates curl file \
    build-essential \
    autoconf automake autotools-dev libtool xutils-dev && \
    rm -rf /var/lib/apt/lists/*

ENV SSL_VERSION=1.0.2k

RUN curl https://www.openssl.org/source/openssl-$SSL_VERSION.tar.gz -O && \
    tar -xzf openssl-$SSL_VERSION.tar.gz && \
    cd openssl-$SSL_VERSION && ./config && make depend && make install && \
    cd .. && rm -rf openssl-$SSL_VERSION*

ENV OPENSSL_LIB_DIR=/usr/local/ssl/lib \
    OPENSSL_INCLUDE_DIR=/usr/local/ssl/include \
    OPENSSL_STATIC=1

RUN curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain nightly -y

# Change if want to copy solana as tar from parent instead of curling from release address
# COPY solana-release-x86_64-unknown-linux-gnu.tar.bz2 solana-release-x86_64-unknown-linux-gnu.tar.bz2
# RUN tar jxf solana-release-x86_64-unknown-linux-gnu.tar.bz2
RUN sh -c "$(curl -sSfL https://release.solana.com/1.5.8/install)"
# Pick one of installers however as of writing this found 1.5.8 as latest stable
# RUN sh -c "$(curl -sSfL https://release.solana.com/stable/install)"
# RUN sh -c "$(curl -sSfL https://release.solana.com/edge/install)"

# path for curled solana
ENV PATH=/root/.local/share/solana/install/active_release/bin:$PATH
# path for targzipped solana
# ENV PATH=$PWD/solana-release/bin:$PATH
ENV PATH=/root/.cargo/bin:$PATH
ENV USER root

WORKDIR /source

CMD ["bash"]