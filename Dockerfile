FROM python:3.11-slim

COPY ./allurectl /bin/allurectl

RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y curl python3 python3-pip python3-dev coreutils
# RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir pytest allure-pytest

# RUN chmod +x /bin/allurectl

COPY . /app
WORKDIR /app

ENTRYPOINT ["/bin/allurectl", "watch", "--", "pytest", "test", "--allure-dir=allure-results"]