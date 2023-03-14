import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :for_reals, ForReals.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "for_reals_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :for_reals, ForRealsWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "gajD1QN/r2greuZ25sq9rs1Q5Rkc7AzL0gigRBc+EhoBUy828lyiriR5eloxP6kX",
  server: false

# In test we don't send emails.
config :for_reals, ForReals.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
