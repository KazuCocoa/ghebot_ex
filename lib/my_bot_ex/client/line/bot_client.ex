defmodule MyBotEx.Client.Line.BotClient do
  import Plug.Conn

  def reply(conn) do
    conn
    |> put_resp_content_type("application/json", "utf-8")
    |> send_resp(200, "ok")

    # https://github.com/yuya-takeyama/line-echo/blob/master/app.rb
    # 'X-Line-ChannelID' => ENV["LINE_CHANNEL_ID"],
    # 'X-Line-ChannelSecret' => ENV["LINE_CHANNEL_SECRET"],
    # 'X-Line-Trusted-User-With-ACL' => ENV["LINE_CHANNEL_MID"],
  end
end
