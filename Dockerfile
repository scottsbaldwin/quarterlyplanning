FROM registry.wellmatchhealth.com/ruby:2.2.0
RUN apt-get update -q
RUN /bin/bash -l -c "gem install bundler --no-doc"

ENV RAILS_ENV production

# Cache the gems
WORKDIR /tmp
ADD Gemfile /tmp/Gemfile
ADD Gemfile.lock /tmp/Gemfile.lock
RUN bundle install --without development test

ADD . /home/qtr
WORKDIR /home/qtr

# Use cached gems to create application bundle
RUN bundle install --without development test
EXPOSE 3000

CMD bundle exec rails s Puma -b 0.0.0.0
RUN bundle exec rake assets:precompile
