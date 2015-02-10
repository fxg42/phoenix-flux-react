use Mix.Config

config :ex_react_ws, ExReactWs.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true,
  cache_static_lookup: false

config :ex_react_ws, bundle_name: "bundle.js"

# Enables code reloading for development
config :phoenix, :code_reloader, true

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
