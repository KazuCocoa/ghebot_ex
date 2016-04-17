defmodule MyBotEx.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link(opt) do
    Plug.Adapters.Cowboy.http(__MODULE__, [], opt)
  end

  get "/hello/revision" do
    RevisionPlateEx.Hello.revision(conn)
  end

  get "/linebot/callback" do
    # TODO: Line
    send_resp(conn, 200, "ok")
  end

  post "/linebot/callback" do
    # TODO: Line
    send_resp(conn, 200, "ok")
  end
end
