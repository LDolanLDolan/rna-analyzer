FROM rstudio/plumber:latest

WORKDIR /app

# Install Bioconductor and Biostrings
RUN R -e "if (!requireNamespace('BiocManager', quietly=TRUE)) install.packages('BiocManager'); BiocManager::install('Biostrings')"

COPY . /app

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::pr('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
