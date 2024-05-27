FROM ruby:3.3.0

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

ENV BUNDLE_PATH /gems

RUN bundle install --gemfile /usr/src/app/Gemfile

COPY . /usr/src/app/

RUN bin/rails tailwindcss:install && bundle install --gemfile /usr/src/app/Gemfile

ENTRYPOINT ["./docker-entrypoint.sh"]

CMD ["bin/rails", "s", "-b", "0.0.0.0"]

