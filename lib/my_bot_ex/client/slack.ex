defmodule MyBotEx.Client.Slack do
  use Slack

  # alias MyBotEx.Client.Slack.Action, as: SlackAction
  alias MyBotEx.Client.Slack.Reporter, as: AppReporter

  # TODO: Please check callback
  # https://github.com/BlakeWilliams/Elixir-Slack/blob/63eba17c53f68a99abd32ceb1c5d526065b02319/lib/slack.ex#L45

  def handle_connect(slack, state) do
    # After establish connection
    {:ok, state}
  end

  def handle_message(message = %{type: "message"}, slack, state) do
    trigger_msg = message.text
                  |> String.split(~r/ |　/)

    case mentioned?(message, slack) do
      true -> reply(:answer, message, slack)
      false -> reply(:hear, message, slack)
    end
    {:ok, state}
  end

  def handle_message(_message, _slack, state), do: {:ok, state}

  defp mentioned?(message, slack), do: String.starts_with?(message.text, "<@#{slack.me.id}>:")

  defp reply(:answer, message, slack) do
    AppReporter.google_play_review("com.android.chrome", "jp")
    |> Enum.each(&send_message(&1, message.channel, slack))

    AppReporter.app_store_revew("375380948", "jp")
    |> Enum.each(&send_message(&1, message.channel, slack))
  end
  defp reply(:hear, message, slack),   do: send_message("Hello?", message.channel, slack)
  defp reply(_, _, _),                 do: IO.inspect "nothing"
end
