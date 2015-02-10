use Mix.Config

# ## SSL Support
#
# To get SSL working, you will need to set:
#
#     https: [port: 443,
#             keyfile: System.get_env("SOME_APP_SSL_KEY_PATH"),
#             certfile: System.get_env("SOME_APP_SSL_CERT_PATH")]
#
# Where those two env variables point to a file on
# disk for the key and cert.

config :ex_react_ws, ExReactWs.Endpoint,
  url: [host: "localhost"],
  http: [port: System.get_env("PORT") || 4000],
  secret_key_base: "rtt51H0jY3WVrIGUb0DXTSBoEfO4PXGhKIY2ERHO8ENG31HPMSYM4HQWPozkO39D"

config :ex_react_ws, bundle_name: "bundle.min.js"

# Do not pring debug messages in production
config :logger, level: :info

# ## Using releases
#
# If you are doing OTP releases, you need to instruct Phoenix
# to start the server for all endpoints:
#
config :phoenix, :serve_endpoints, true
#
# Alternatively, you can configure exactly which server to
# start per endpoint:
#
#     config :ex_react_ws, ExReactWs.Endpoint, server: true
#
