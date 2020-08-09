FROM ruby:2.7-alpine3.11

ENV BUNDLER_VERSION=2.1.2

RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \ 
    libgcrypt-dev \
    make \
    netcat-openbsd \
    openssl \
    pkgconfig \
    python \
    tzdata \
    sqlite-dev

RUN gem install bundler -v 2.1.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri "--use-system-libraries --with-xml2-include=/usr/local/opt/libxml2/include/libxml2"

RUN bundle check || bundle install

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]