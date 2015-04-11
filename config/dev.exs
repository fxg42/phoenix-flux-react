use Mix.Config

config :ex_react_ws, ExReactWs.Endpoint,
  http: [port: System.get_env("PORT") || 4000],
  debug_errors: true,
  cache_static_lookup: false,
  code_reloader: true,
  live_reload: [
    # url is optional
    url: "ws://localhost:#{System.get_env("PORT") || 4000}",
    # `:patterns` replace `:paths` and are required for live reload
    patterns: [~r{priv/static/.*(js|css|png|jpeg|jpg|gif)$},
               ~r{web/views/.*(ex)$},
               ~r{web/templates/.*(eex)$}]
  ]

config :ex_react_ws, bundle_name: "bundle.js"

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"
