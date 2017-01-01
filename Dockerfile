FROM iron/ruby:2.3.1

ADD Gemfile .
ADD Gemfile.lock .

RUN \
    # update packages
    apk update && apk upgrade && \

    # install ruby with dev tools to compile native extensions
    apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal && \

    # for `gem 'unf_ext'` for `gem http`
    apk --no-cache add make g++ && \

    # for `gem 'unf_ext'` for `gem http`
    rm -rf /var/cache/apk/*

RUN bundle install

# build with:
#   docker build --rm --force-rm -t soumyaray/ruby-http:2.3.1 .
