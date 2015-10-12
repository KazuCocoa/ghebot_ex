defmodule MyBotExTest.Client.Slack.ReporterTest do
  use ExUnit.Case, async: true

  alias MyBotEx.Client.Slack

  test "correct GooglePlay review url" do
    review_uel = "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=en"
    assert Reporter.GooglePlay.review_url %Slack{}.droid_package, %Slack{}.droid_locale == review_uel
  end

  test "correct AppStore review url" do
    review_uel = "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/json"
    assert Reporter.AppStore.rss_json %Slack{}.app_id, %Slack{}.app_locale == review_uel
  end
end
