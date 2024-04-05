FROM ruby:3.3

LABEL maintainer="R1CH@damianrichter58@gmail.com"

RUN apt-get update -y \
  && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  nodejs \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile* /usr/src/app/
WORKDIR /usr/src/app
RUN  bundle install && bin/rails tailwindcss:install && bundle install

COPY . /usr/src/app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

