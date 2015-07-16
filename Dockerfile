FROM phusion/baseimage:0.9.16

MAINTAINER Andy Grant <andy.a.grant@gmail.com>

RUN echo "deb http://binaries.erlang-solutions.com/debian `lsb_release -cs` contrib" | tee /etc/apt/sources.list.d/erlang-solutions.list

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    lsb-release \
    wget

ENV ERLANG_VERSION 18.0
ENV ELIXIR_VERSION 1.0.5-2

RUN wget -O - http://binaries.erlang-solutions.com/debian/erlang_solutions.asc | apt-key add - && \
    apt-get update && apt-get install -y \
    erlang-base-hipe=1:$ERLANG_VERSION \
    erlang-dev=1:$ERLANG_VERSION \
    erlang-nox=1:$ERLANG_VERSION \
    elixir=$ELIXIR_VERSION

VOLUME ["/projects"]

WORKDIR /projects

