defmodule StockQuote do
  use GenServer

  defstruct name: '', value: 0, event_mgr_name: nil

  def start_link(event_mgr_name, name) do
    GenServer.start_link(__MODULE__, [event_mgr_name, name])
  end

  def init([event_mgr_name, name]) do
    :erlang.send_after(100, self, :emit_quote)

    {:ok, %StockQuote{
      event_mgr_name: event_mgr_name,
      name: name,
      value: Random.between(0, 1000)}}
  end

  def handle_info(:emit_quote, state) do
    GenEvent.notify(state.event_mgr_name, state)
    :erlang.send_after(trunc(Random.between(500, 1000)), self, :emit_quote)

    {:noreply, %{state | value: Random.between(0, 1000)}}
  end
end
