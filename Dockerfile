FROM alpine:3.4

MAINTAINER Dairon Medina <me@dairon.org>

RUN apk update && \
 apk add --no-cache git openssh-client grep build-base wget openssl htop vim && \
 apk add --no-cache erlang \
 erlang-tools \
 erlang-runtime-tools \
 erlang-sasl \
 erlang-crypto \
 erlang-ssl \
 erlang-public-key \
 erlang-asn1 \
 erlang-inets \
 erlang-syntax-tools \
 erlang-mnesia \
 erlang-dev \
 erlang-parsetools \
 erlang-eunit \
 erlang-snmp \
 erlang-hipe

EXPOSE 8080
WORKDIR /opt/app
ENV REBAR_PROFILE=prod
COPY . .
RUN wget https://s3.amazonaws.com/rebar3/rebar3 && \
    chmod +x rebar3 && \
    make

CMD["bash"]