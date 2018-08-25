use Mix.Config

# Configure your database
config :steiger, Steiger.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "steiger_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
