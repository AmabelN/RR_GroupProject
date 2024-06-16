FROM --platform=linux/amd64 eddelbuettel/r2u:20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    pandoc \
    pandoc-citeproc \
    curl \
    gdebi-core \
    && rm -rf /var/lib/apt/lists/*

RUN install.r \
    dplyr \
    tidyr \
    ggplot2 \
    patchwork \
    corrplot \
    ggExtra \
    gbm \
    caret \
    caTools \
    stats \
    GGally \
    neuralnet \
    Metrics \
    e1071 \
    groundhog \
    quarto \
    gridExtra


# ARG QUARTO_VERSION="0.9.522"
# RUN curl -o quarto-linux-amd64.deb -L https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb
RUN curl -LO https://quarto.org/download/latest/quarto-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

CMD ["bash"]
