defmodule MyBotEx.Client.Slack do
  use Slack

  # TODO: Please check callback
  # https://github.com/BlakeWilliams/Elixir-Slack/blob/63eba17c53f68a99abd32ceb1c5d526065b02319/lib/slack.ex#L45

  def handle_connect(slack, state) do
    send_message("hello", "C02AT3GEG", slack)
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    message_to_send = "Received #{length(state)} messages so far!"
    IO.puts  message.channel
    send_message(message_to_send, message.channel, slack)

    {:ok, state ++ [message.text]}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end
end
