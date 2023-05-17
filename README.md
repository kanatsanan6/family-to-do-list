# CMS-Backend

## [LiveDemo](https://family-to-do-list.herokuapp.com/)

## Prerequisite

- PostgreSQL
- Redis

- ruby version 3.2.2

```bash
rbenv install 3.2.2
```

- rails 7

```bash
gem install rails
```

## Project setup

- copy env file and change env value if needed

```bash
cp .env.example .env
```

- install dependencies

```bash
bundle install
```

- create and migrate database

```bash
bundle exec rails db:create db:migrate
```

## Start an application

- Start Application

```bash
bin/rails server
```

- Start Sidekiq

```bash
bundle exec sidekiq
```

## API ENDPOINT

- `GET /api/v1/tasks` -> Get outstanding task of each member

```basb
curl --location 'https://family-to-do-list.herokuapp.com/api/v1/tasks'
```
