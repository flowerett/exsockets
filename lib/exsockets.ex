defmodule Exsockets do
  use Application

  alias Plug.Adapters.Cowboy

  def start(_, _) do
    import Supervisor.Spec

    children = [
      Cowboy.child_spec(:http, Exsockets.Server, [], [dispatch: dispatch]),
      worker(Exsockets.PubSub, [])
    ]

    opts = [strategy: :one_for_one, name: Exsockets.Supervisor]

    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {
        :_,
        [
          {"/ws", Exsockets.Socket, []},
          {:_, Cowboy.Handler, {Exsockets.Server, []}}
        ]
      }
    ]
  end
end
