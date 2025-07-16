# Use Bioconductor base image to ensure proper dependencies
FROM bioconductor/bioconductor_docker:RELEASE_3_19

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install required R packages
RUN R -e "install.packages('plumber', repos='https://cloud.r-project.org')"
RUN R -e "BiocManager::install('Biostrings')"

# Create app directory
WORKDIR /app

# Copy application files
COPY . .

# Expose port
EXPOSE 8000

# Start the plumber API
CMD ["R", "-e", "plumber::plumb('app.R')$run(host='0.0.0.0', port=8000)"]