defmodule MyBotEx.Client.Slack.Action do
  use Slack
  use Timex

  alias MyBotEx.Client.Slack.Action, as: SAction
  alias MyBotEx.Client.Slack.Reporter, as: AppReporter
  alias MyBotEx.Client.Github.User, as: GithubUser
  alias MyBotEx.Client.Github.Trend, as: GithubTrend

  defstruct droid_package: Application.get_env(:reporter, :droid_package),
            droid_locale:  Application.get_env(:reporter, :droid_locale),
            app_id:        Application.get_env(:reporter, :app_id),
            app_locale:    Application.get_env(:reporter, :app_locale)

  def reply("my streak", channel, slack) do
    streak = GithubUser.streak("KazuCocoa")
    "current streak is #{Integer.to_string(streak)}"
    |> send_message(channel, slack)
  end

  def reply("trend", channel, slack) do
    message = GithubTrend.list
              |> Enum.reduce("", fn trend_item, acc ->
                acc <> ~s"""
                #{trend_item.name} : #{trend_item.url}
                #{trend_item.description}
                ++++++++++
                """
              end)
    send_message(message, channel, slack)
  end

  def reply("review android", channel, slack) do
    AppReporter.google_play_review(%SAction{}.droid_package, %SAction{}.droid_locale)
    |> Enum.each(&send_message(&1, channel, slack))
  end

  def reply("review ios", channel, slack) do
    AppReporter.app_store_revew(%SAction{}.app_id, %SAction{}.app_locale)
    |> Enum.each(&send_message(&1, channel, slack))
  end

  def reply("reviews", channel, slack) do
    ["review android", "review ios"]
    |> Enum.map(&(Task.async( fn -> reply(&1, channel, slack) end)))
    |> Enum.map(&(Task.await/1))
  end

  def reply("time", channel, slack) do
    case Date.local |> DateFormat.format("{ISO}") do
      {:ok, time} ->
        send_message(time, channel, slack)
      {:error, message} ->
        send_message(message, channel, slack)
    end
  end
  def reply("hello", channel, slack), do: send_message("hello, I'm a bot.", channel, slack)
  def reply("help", channel, slack) do
    help_message = ~s"""
    "review android": reply the result of review for Google Play
    "review ios": reply the result of review for App Store
    """
    send_message(help_message, channel, slack)
  end
  def reply(_, channel, slack), do: send_message("I have no response. Please see help.", channel, slack)
end
