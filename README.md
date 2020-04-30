# Barebones Phoenix 1.5.1 Project Using Guardian for Authentication

The protected route is `/products`. All other routes are free to access.

> For some weird reason, the project won't compile under Windows since it requires Argon2_elixir (which requires native compilation that is not easy to set up).

To get the project working, I used WSL from within VS Code and everything works 100%.

## Installing Elixir and Its Tools in WSL

```bash

wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb && sudo dpkg -i erlang-solutions_2.0_all.deb
sudo apt-get update
sudo apt-get install esl-erlang
sudo apt-get install elixir
sudo apt-get install build-essential
mix archive.install hex phx_new 1.5.1
sudo apt-get install -y inotify-tools

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bas
nvm install --lts
```

In case you need to access a PostgreSQL instance that you installed inside Windows, you can do:

```bash
sudo apt install postgresql-client-common
sudo apt-get install postgresql-client
psql -h 127.0.0.1 -p 5432 -U postgres

```

To start your Phoenix server:

* Install dependencies with `mix deps.get`
* Create and migrate your database with `mix ecto.setup`
* Install Node.js dependencies with `cd assets && npm install`
* Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
