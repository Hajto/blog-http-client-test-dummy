defmodule HttpTestServer do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    IO.inspect "Starting application"
    children = [
      # Define workers and child supervisors to be supervised
      Plug.Adapters.Cowboy.child_spec(:http, Test.Router, [], [port: 4000]) |> IO.inspect
    ]

    opts = [strategy: :one_for_one, name: MyApp.Supervisor]
    Supervisor.start_link(children, opts) |> IO.inspect
  end
end
