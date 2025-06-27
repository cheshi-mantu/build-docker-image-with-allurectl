FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y curl python3 python3-pip coreutils \
    && pip3 install --no-cache-dir pytest allure-pytest

COPY ./allurectl /bin/allurectl
# RUN chmod +x /bin/allurectl

COPY . /app
WORKDIR /app

ENTRYPOINT ["/bin/allurectl", "watch", "--", "pytest", "test", "--allure-dir=allure-results"]