defmodule Test.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, DateTime.to_unix(DateTime.utc_now) |> inspect())
  end

end
