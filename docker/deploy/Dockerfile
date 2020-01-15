FROM ruby:2.6.5-alpine

ENV RAILS_LOG_TO_STDOUT=true \
  RAILS_SERVE_STATIC_FILES=true

ARG BUILDER

LABEL "host.openpath.app"=warehouse
LABEL "host.openpath.role"=web
LABEL "host.openpath.ruby-version"=2.6.5

RUN apk add --no-cache \
  nodejs yarn \
  tzdata \
  freetds-dev \
  icu icu-dev \
  libcurl curl-dev \
  imagemagick6-dev \
  libmagic file-dev file \
  build-base libxml2-dev libxslt-dev postgresql-dev

RUN mkdir -p /openpath/tmp/pids

WORKDIR /openpath

RUN gem install bundler --version=1.17.3

COPY Gemfile Gemfile.lock Rakefile config.ru package.json ./
COPY bin ./bin
COPY public ./public

RUN bundle install --without=development

COPY lib ./lib
COPY config ./config
COPY spec ./spec
COPY db ./db
COPY app ./app
COPY vendor ./vendor

# Just need this so that assets will build. Then we remove it
COPY docker/deploy/dotenv.temporary ./.env
RUN RAILS_ENV=production bundle exec rake assets:precompile
RUN rm .env

# Add a script to be executed every time the container starts.
COPY docker/deploy/entrypoint.sh /usr/bin/

COPY docker/deploy/REVISION ./

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

# Start the main process.
CMD ["puma"]
