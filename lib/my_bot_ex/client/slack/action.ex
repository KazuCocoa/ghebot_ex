defmodule MyBotEx.Client.Slack.Actio do

  # TODO: separate actions

  def reply(:answer, message, slack, state) do
    Slack.send_message("hello, i'm a bot.", message.channel, slack)
  end

  def reply(:hear, message, slack, state) do
    Slack.send_message("Hello?", message.channel, slack)
  end

  def reply(_, _, _, state), do: {:ok, state}
end
