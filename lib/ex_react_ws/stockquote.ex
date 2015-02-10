defmodule StockQuote do
  use GenServer

  defstruct name: '', value: 0

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    :erlang.send_after(100, self, :emit_quote)
    {:ok, %StockQuote{name: name, value: Random.between(0, 1000)}}
  end

  def handle_info(:emit_quote, state) do
    GenEvent.notify(StockQuoteEventMgr, state)
    :erlang.send_after(trunc(Random.between(500, 1000)), self, :emit_quote)
    {:noreply, %{state | value: Random.between(0, 1000)}}
  end
end
