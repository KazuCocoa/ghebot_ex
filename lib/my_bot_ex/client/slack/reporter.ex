defmodule MyBotEx.Client.Slack.Reporter do
  import Reporter

  @get_count_google Application.get_env :reporter, :get_count_google
  @get_count_apple  Application.get_env :reporter, :get_count_apple

  def google_play_review(app_package, locale) do
    Reporter.google_play!(app_package, locale)
    |> Reporter.GooglePlay.review_summaries
    |> Enum.take(@get_count_google)
    |> List.foldr([], fn (review, acc) ->
      [":green_apple: " <> format(review)] ++ acc
    end)
  end

  def app_store_revew(app_id, locale) do
    Reporter.app_store_rss_json!(app_id, locale)
    |> Reporter.AppStore.review_summaries
    |> Enum.take(@get_count_apple)
    |> List.foldr([], fn (review, acc) ->
      [":apple: " <> format(review)] ++ acc
    end)
  end

  defp format(review) do
    ~s"""
    author: #{review["author"]}
    rating: #{review["rating"]}
    title: #{review["title"]}
    body: #{review["body"]}
    """
  end
end
