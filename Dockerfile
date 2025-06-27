FROM python:3.11-slim

COPY ./allurectl /bin/allurectl
RUN chmod +x /bin/allurectl
RUN apt-get update && apt-get upgrade -y
# RUN apt-get install -y curl python3 python3-pip python3-dev coreutils
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir pytest allure-pytest

COPY . /app
WORKDIR /app

CMD ["/bin/allurectl", "watch", "--", "pytest", "test", "--alluredir=allure-results"]