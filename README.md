# The Wall [![Deploy](https://github.com/kalashnikovisme/wall/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/kalashnikovisme/wall/actions/workflows/deploy.yml)

The sample Rails application for MRSK deploy.

This repository contains example applications demonstrating how to deploy Rails applications with Sidekiq and AnyCable using MRSK.

> Read more in [our blog-post](https://evilmartians.com).

It includes

* PostgreSQL
* Sidekiq - for background tasks
* AnyCable - for Turbo Rails

# Deploy

1. Install mrsk `gem install mrsk`
2. Provide all secrets below to the `ENV_FILE` (but not .env). Don't commit this file! You can find [.env.example here](https://github.com/kalashnikovisme/wall/blob/main/.env.example).

| Secret | Description | Source |
| ------------- | ------------- | ------------- |
| `RAILS_MASTER_KEY` | Encryption key for Rails Credentials | Generate it yourself |
| `MRSK_REGISTRY_PASSWORD` | Your Docker Hub password |  |
| `DO_SPACES_KEY` | Digital Ocean Spaces Key | Create Digital Ocean Space (or another S3 compatible storage) and you will get it |
| `DO_SPACES_SECRET` | Digital Ocean Spaces Secret | Create Digital Ocean Space (or another S3 compatible storage) and you will get it |
| `DO_SPACES_BUCKET` | Digital Ocean Spaces Bucket | Create Digital Ocean Space (or another S3 compatible storage) and you will get it |
| `DO_SPACES_REGION` | Digital Ocean Spaces Region | Create Digital Ocean Space (or another S3 compatible storage) and you will get it |
| `POSTGRES_USER` | User in PostgreSQL that be used to access the DB from Rails | Generate it youself  |
| `POSTGRES_PASSWORD` | Password of the PostgreSQL user | Generate it yourself |
| `POSTGRES_DB` | Database for Rails application | Generate it yourself |
| `MAIN_HOST` | The main host of your Rails application | Get it from the hosting platform |
| `ANYCABLE_GO_HOST` | The host which contains [AnyCable Go](https://anycable.io/) web socket server | Get it from the hosting platform |
| `DB_HOST` | The host for PostgreSQL | Get it from the hosting platform |
| `REDIS_HOST` | The host for Redis | Get it from the hosting platform |
| `REDIS_PASSWORD` | The password to access the Redis instance | Generate it yourself |
| `NEW_RELIC_KEY` | The key of your New Relic account | Get it from your New Relic account |

3. Prepare your secrets

```
export `cat ../ENV_FILE | xargs` && mrsk envify
```

4. Setup all services

```
mrsk setup
```

5. Open the `MAIN_HOST` and enjoy your application

## via GitHub Actions

 [![Deploy](https://github.com/kalashnikovisme/wall/actions/workflows/deploy.yml/badge.svg?branch=main)](https://github.com/kalashnikovisme/wall/actions/workflows/deploy.yml)

We've prepared GitHub Actions workflow for a deployment. To use it provide all secrets above to repository secrets and run a workflow.

# Run locally

## Install

We use [dip](https://github.com/bibendi/dip)

```
dip provision
```

## Run

```
dip up web anycable sidekiq
```
