defmodule ExReactWs.Endpoint do
  use Phoenix.Endpoint, otp_app: :ex_react_ws

  plug Plug.Static,
    at: "/", from: :ex_react_ws,
    only: ~w(css images js favicon.ico robots.txt)

  plug Plug.Logger

  if code_reloading? do
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_ex_react_ws_key",
    signing_salt: "c28pkVC8",
    encryption_salt: "Uf6gEJLx"

  plug :router, ExReactWs.Router

end
