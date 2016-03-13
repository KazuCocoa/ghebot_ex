defmodule MyBotEx.Client.Github.Trend do
  def list(lang \\ ""), do: GithubTrendEx.trend(lang) |> GithubTrendEx.list
end
