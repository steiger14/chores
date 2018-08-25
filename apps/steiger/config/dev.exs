use Mix.Config

# Configure your database
config :steiger, Steiger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "steiger_dev",
  hostname: "localhost",
  pool_size: 10
