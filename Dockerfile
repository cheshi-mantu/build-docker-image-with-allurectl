FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y
RUN apt install curl -y
RUN apt-get install coreutils
COPY ./bin /bin/
COPY ./resources /resources/
RUN chmod +x bin/allurectl
RUN chmod +x bin/alluregen
ENTRYPOINT ["bin/allurectl", "watch", "--", "bin/alluregen", "do", "--strategy", "ALL_PASSED"]