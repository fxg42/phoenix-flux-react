defmodule ExReactWs.StockQuoteChannel do
  use Phoenix.Channel
  use GenEvent

  @topic "stockquotes"

  def join(@topic, _message, socket) do
    {:ok, socket}
  end

  def handle_in("add:quote", _payload, socket) do
    StockQuoteSupervisor.start_child()
    {:noreply, socket}
  end

  def handle_event(event, _parent) do
    ExReactWs.Endpoint.broadcast! @topic, "update:quote", %{quote: event}
    {:ok, nil}
  end
end
