FROM ruby:3.2-alpine

RUN apk --update --no-cache add build-base nodejs git zsh curl tzdata postgresql-dev \
                     postgresql-client libxslt-dev libxml2-dev imagemagick vips

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

RUN mkdir /app
WORKDIR /app
ADD . /app

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"

RUN bundle install
