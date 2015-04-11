defmodule ExReactWs.PageController do
  use ExReactWs.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
