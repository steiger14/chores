# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :steiger_web,
  namespace: SteigerWeb,
  ecto_repos: [Steiger.Repo]

# Configures the endpoint
config :steiger_web, SteigerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "W9Efq0nHypRbUanizljVNigN2Z/UX3eSVKGf87A1ca7DAioGVDy6x8yA7p0qzKzR",
  render_errors: [view: SteigerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: SteigerWeb.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :steiger_web, :generators,
  context_app: :steiger

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
