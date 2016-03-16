defmodule Exsockets.Server do
  import Plug.Conn

  def init(_opts) do
  end

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("application/text")
    |> send_resp(200, "OK")
  end
end
