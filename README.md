# Book Collection

Rails 8 book collection app for CSCE 431: CRUD for books, users, and the user-book join table, with RSpec tests and PostgreSQL.

## Requirements

- Ruby 3.3
- Rails 8.1
- PostgreSQL 16+ (local install or Docker)

## Setup

Start PostgreSQL. With Docker:

```bash
docker compose up -d db
```

Create the databases, run migrations, and seed sample data:

```bash
bundle install
bin/rails db:create db:migrate db:seed
```

Run the app:

```bash
bin/rails server
```

Open http://127.0.0.1:3000 — the root page is **User Books**. Book CRUD lives at `/books` (Home, Add, Show, Update, Delete).

## Tests

```bash
bundle exec rspec
```

## Default database login

`config/database.yml` uses `postgres` / `postgres` on `localhost:5432`. Override with `DATABASE_HOST`, `DATABASE_PORT`, `DATABASE_USERNAME`, and `DATABASE_PASSWORD` if needed.
