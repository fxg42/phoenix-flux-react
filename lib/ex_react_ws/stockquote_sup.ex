defmodule StockQuoteSupervisor do
  use Supervisor

  def start_link() do
    result = {:ok, sup} = Supervisor.start_link(__MODULE__, [], name: __MODULE__)
    start_workers(sup)
    result
  end

  def start_child() do
    Supervisor.start_child(__MODULE__, [get_random_quote_name])
  end

  def init(_) do
    children = [
      worker(StockQuote, [])
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

  def start_workers(sup) do
    [ "AAPL", "FB", "TWTR", "GOOG", "MSFT" ]
    |> Enum.each(&Supervisor.start_child(sup, [&1]))
  end

  def get_random_quote_name do
    <<a::size(32), b::size(32), c::size(32)>> = :crypto.rand_bytes(12)
    :random.seed {a, b, c}
    (for n <- 1..(fetch_value(2, 4)), do: fetch_value(65, 90)) |> to_string
  end

  def fetch_value(min, max) do
    :random.uniform(max - min + 1) + min - 1
  end
end
