defmodule ExReactWs.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", ExReactWs do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  socket "/ws", ExReactWs do
    channel "stockquotes", StockQuoteChannel
  end

  # Other scopes may use custom stacks.
  # scope "/api", ExReactWs do
  #   pipe_through :api
  # end
end
