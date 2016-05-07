defmodule MyBotExTest.Client.Slack.ReporterTest do
  use ExUnit.Case, async: true

  alias MyBotEx.Client.Slack.Reporter, as: SlackReporter

  test "correct GooglePlay review url" do
    review_uel = "https://play.google.com/store/getreviews?id=com.android.chrome&xhr=1&reviewSortOrder=0&reviewType=1&pageNum=0&hl=en"
    assert Reporter.GooglePlay.review_url("com.android.chrome") == review_uel
  end

  test "correct AppStore review url" do
    review_uel = "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/json"
    assert Reporter.AppStore.rss_json(375380948) == review_uel
  end
end
