FROM ruby:3.3

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/app/

WORKDIR /usr/src/app
RUN bundle install

