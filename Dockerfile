FROM rocker/plumber

COPY . /app
WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["R", "-e", "pr <- plumber::pr('plumber.R'); pr$run(host='0.0.0.0', port=8000)"]
