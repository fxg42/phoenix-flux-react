defmodule ExReactWs do
  use Application

  @event_mgr_name StockQuoteEventMgr
  @channel_name ExReactWs.StockQuoteChannel

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Start the endpoint when the application starts
      worker(ExReactWs.Endpoint, []),
      worker(GenEvent, [[name: @event_mgr_name]]),
      supervisor(StockQuoteSupervisor, [@event_mgr_name]),
      worker(Register, [@event_mgr_name, @channel_name]),
    ]

    opts = [strategy: :rest_for_one, name: ExReactWs.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ExReactWs.Endpoint.config_change(changed, removed)
    :ok
  end
end
