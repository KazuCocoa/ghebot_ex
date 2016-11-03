defmodule MyBotEx.Client.Slack do
  use Slack

  alias MyBotEx.Client.Slack.Action, as: SlackAction

  # TODO: Please check callback
  # https://github.com/BlakeWilliams/Elixir-Slack/blob/63eba17c53f68a99abd32ceb1c5d526065b02319/lib/slack.ex#L45

  def start_link(key, _ops) do
    Elixir.Slack.Bot.start_link __MODULE__, [], key
  end

  def handle_connect(_slack, state), do: {:ok, state}

  def handle_event(message = %{type: "message"}, slack, state) do
    case mentioned?(message, slack) do
      true -> reply(:answer, message, slack)
      false -> reply(:hear, message, slack)
    end
    {:ok, state}
  end

  def handle_event(_message, _slack, state), do: {:ok, state}

  defp mentioned?(message, slack), do: String.starts_with?(message.text, "<@#{slack.me.id}>")

  defp reply(:answer, message, slack) do
    message.text
    |> String.replace(~r/\A<.+> /, "")
    |> SlackAction.reply(message.channel, slack)
  end
  defp reply(:hear, message, slack),   do: send_message("Hello?", message.channel, slack)
  defp reply(_, _, _),                 do: IO.inspect "nothing"
end
