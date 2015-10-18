defmodule MyBotExTest.Client.Slack.ReporterTest do
  use ExUnit.Case, async: true

  alias MyBotEx.Client.Slack.Reporter, as: SlackReporter

  test "correct GooglePlay review url" do
    review_uel = "https://play.google.com/store/getreviews?id=com.android.chrome&reviewSortOrder=0&reviewType=1&pageNum=0&hl=en"
    assert Reporter.GooglePlay.review_url %SlackReporter{}.droid_package, %SlackReporter{}.droid_locale == review_uel
  end

  test "correct AppStore review url" do
    review_uel = "https://itunes.apple.com/en/rss/customerreviews/id=375380948/sortby=mostrecent/json"
    assert Reporter.AppStore.rss_json %SlackReporter{}.app_id, %SlackReporter{}.app_locale == review_uel
  end

  test "check structure" do
    assert %SlackReporter{}.droid_package == "com.android.chrome"
    assert %SlackReporter{}.droid_locale == "en"
    assert %SlackReporter{}.app_id == "375380948"
    assert %SlackReporter{}.app_locale == "en"
  end
end
