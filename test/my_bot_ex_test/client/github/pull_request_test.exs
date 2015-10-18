defmodule MyBotExTest.Client.Github.PullRequestTest do
  use ExUnit.Case, async: true
  use ExUnit.Parametarized

  alias MyBotEx.Client.Github.PullRequest

  test_with_params "check all actions",
    fn (act, expected) ->
      assert PullRequest.action(act) == expected
    end do
      [
        {"opened", "opened"},
        {"closed", "closed"},
        {"reopened", "reopened"},
        {"assigned", "assigned"},
        {"unassigned", "unassigned"},
        {"labeled", "labeled"},
        {"unlabeled", "unlabeled"},
        {"synchronize", "synchronize"}
      ]
  end
end
