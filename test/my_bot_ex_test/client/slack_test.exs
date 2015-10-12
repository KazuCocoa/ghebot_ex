defmodule MyBotExTest.Client.SlackTest do
  use ExUnit.Case, async: true

  alias MyBotEx.Client.Slack

  test "check structure" do
    assert %Slack{}.droid_package == "com.android.chrome"
    assert %Slack{}.droid_locale == "en"
    assert %Slack{}.app_id == "375380948"
    assert %Slack{}.app_locale == "en"
  end
end
