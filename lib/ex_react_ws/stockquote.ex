defmodule StockQuote do
  use GenServer

  defstruct name: '', value: 0

  def start_link(name) do
    GenServer.start_link(__MODULE__, name)
  end

  def init(name) do
    seed
    :erlang.send_after(100, self, :emit_quote)
    {:ok, %StockQuote{name: name, value: rand_between(0, 1000)}}
  end

  def handle_info(:emit_quote, state) do
    GenEvent.notify(StockQuoteEventMgr, state)
    :erlang.send_after(trunc(rand_between(500, 1000)), self, :emit_quote)
    {:noreply, %{state | value: rand_between(0, 1000)}}
  end

  def rand_between(min, max) do
    :random.uniform(max - min + 1) + min - 1
  end

  def seed do
    <<a::size(32), b::size(32), c::size(32)>> = :crypto.rand_bytes(12)
    :random.seed {a, b, c}
  end
end
