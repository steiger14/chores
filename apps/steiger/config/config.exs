use Mix.Config

config :steiger, ecto_repos: [Steiger.Repo]

import_config "#{Mix.env}.exs"
