defmodule StockQuoteSupervisor do
  use Supervisor

  def start_link(event_mgr_name) do
    {:ok, pid} = Supervisor.start_link(__MODULE__, [event_mgr_name], name: __MODULE__)
    start_workers(pid)
    {:ok, pid}
  end

  def init([event_mgr_name]) do
    children = [
      worker(StockQuote, [event_mgr_name])
    ]
    supervise(children, strategy: :simple_one_for_one)
  end

  def start_child() do
    Supervisor.start_child(__MODULE__, [get_random_quote_name])
  end

  def start_workers(pid) do
    [ "AAPL", "FB", "TWTR", "GOOG", "MSFT" ]
    |> Enum.each(&Supervisor.start_child(pid, [&1]))
  end

  def get_random_quote_name do
    (for n <- 1..(Random.between(2, 4)), do: Random.between(65, 90)) |> to_string
  end
end
