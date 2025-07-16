FROM rstudio/plumber:latest

WORKDIR /app

# Install system dependencies (recommended for Biostrings and Bioconductor tools)
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libgit2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    && rm -rf /var/lib/apt/lists/*

# Install BiocManager and Biostrings
RUN R -e "install.packages('BiocManager', repos='https://cloud.r-project.org')" \
 && R -e "BiocManager::install('Biostrings', ask = FALSE, update = FALSE)" \
 && R -e "BiocManager::install('biomaRt', ask = FALSE, update = FALSE)"


COPY . /app

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::pr('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
