FROM openjdk:8-jre

EXPOSE 8000

ARG URL=http://dynamodb-local.s3-website-us-west-2.amazonaws.com

RUN mkdir -p /data
WORKDIR /data
RUN curl -L $URL/dynamodb_local_latest | /bin/tar xz

ENTRYPOINT ["java"]
CMD ["-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar"]