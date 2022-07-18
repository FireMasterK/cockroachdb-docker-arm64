FROM debian:stable-slim

RUN apt-get update && apt-get -y upgrade && apt-get install -y libc6 ca-certificates tzdata hostname tar && rm -rf /var/lib/apt/lists/*

WORKDIR /cockroach/

ENV PATH=/cockroach:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p /cockroach/ /usr/local/lib/cockroach

COPY ./cockroach /cockroach/cockroach

EXPOSE 26257 8080

ENTRYPOINT ["/cockroach/cockroach"]
