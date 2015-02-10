defmodule Register do
  use GenServer

  def start_link(event_mgr_name, channel_name) do
    GenServer.start_link(__MODULE__, [event_mgr_name, channel_name])
  end

  def init([event_mgr_name, channel_name]) do
    :ok = GenEvent.add_handler(event_mgr_name, channel_name, [])
    {:ok, nil}
  end
end
