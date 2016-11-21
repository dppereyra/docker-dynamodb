FROM openjdk:8-jre

EXPOSE 8000

ARG URL=http://dynamodb-local.s3-website-us-west-2.amazonaws.com

RUN mkdir -p /data
WORKDIR /data
ADD run_dynamodb.sh .
RUN chmod +x /data/run_dynamodb.sh && \
    curl -L $URL/dynamodb_local_latest | /bin/tar xz

ENTRYPOINT ["/data/run_dynamodb.sh"]
