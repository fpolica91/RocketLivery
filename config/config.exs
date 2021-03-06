# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocketlivery,
  ecto_repos: [Rocketlivery.Repo]

 config :rocketlivery, Rocketlivery.Repo, migration_primary_key: [type: :binary_id], migration_foreign_key: [type: :binary_id]

 config :rocketlivery, RocketliveryWeb.Auth.Guardian,
       issuer: "rocketlivery",
       secret_key: "pxNCaXKuyF40v6rYDeuyEcPs02PWAZxyaippQZKIo4wUoJqbN6dUYBS6CjA41vdt"

config :rocketlivery,  RocketliveryWeb.Auth.Pipeline,
       module: RocketliveryWeb.Auth.Guardian,
       error_handler: RocketliveryWeb.Auth.ErrorHandler

# Configures the endpoint
config :rocketlivery, RocketliveryWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FPPiBLY7EBMVi7eQavW7tbj5zKgtspkxH8N8RhL1WhAmFVOt7QxDbfYArYrKRm7Y",
  render_errors: [view: RocketliveryWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Rocketlivery.PubSub,
  live_view: [signing_salt: "5Pb6++Kl"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
