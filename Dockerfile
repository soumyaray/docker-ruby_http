FROM ruby:2.5.3-alpine

RUN \
    # update alpine packages
    apk update \
    && apk upgrade \
    # install ruby with dev tools to compile native extensions
    && apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal \
    # for gem 'unf_ext', which is needed for gems like 'http'
    && apk --no-cache add make g++ \
    && rm -rf /var/cache/apk/*

# build image with:
#   docker build --rm --force-rm -t soumyaray/ruby-http:2.5.3 .

# (OPTIONAL) push image to docker hub with:
#   docker push soumyaray/ruby-http:2.5.3
