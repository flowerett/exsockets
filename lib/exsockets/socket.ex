defmodule Exsockets.Socket do
  @behaviour :cowboy_websocket_handler

  def init(_, _req, _opts) do
    {:upgrade, :protocol, :cowboy_websocket}
  end

  ## Callbacks

  alias Exsockets.PubSub

  def websocket_handle({:text, "ping"}, req, state) do
    {:reply, {:text, "pong"}, req, state}
  end
  def websocket_handle({:text, "subscribe|" <> topic}, req, state) do
    PubSub.subscribe(topic)

    {:ok, req, state}
  end
  def websocket_handle({:text, "unsubscribe|" <> topic}, req, state) do
    PubSub.unsubscribe(topic)

    {:ok, req, state}
  end
  def websocket_handle({:text, _}, req, state) do
    {:ok, req, state}
  end

  def websocket_info(message, req, state) do
    {:reply, {:text, message}, req, state}
  end

  def websocket_init(_type, req, _opts) do
    {:ok, req, %{}, 60_000}
  end
end
