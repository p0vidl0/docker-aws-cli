FROM alpine:3.12

RUN apk -v add python3 py3-pip python3-dev libffi-dev openssl-dev build-base git curl nano

RUN pip3 install --upgrade awscli awsebcli s3cmd

RUN apk -v --purge del libffi-dev openssl-dev build-base
RUN rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /project
WORKDIR /project

ENTRYPOINT ["sh"]
