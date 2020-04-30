# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :tracker,
  ecto_repos: [Tracker.Repo]

# Configures the endpoint
config :tracker, TrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "some_secret",
  render_errors: [view: TrackerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Tracker.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "something"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# for guardian
config :tracker, Tracker.Accounts.Guardian,
  issuer: "tracker",
  secret_key: "some_secret"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
