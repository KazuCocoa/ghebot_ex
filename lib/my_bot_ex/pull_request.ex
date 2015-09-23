defmodule MyBotEx.PullRequest do
  def action("opened"), do: "opened"
  def action("closed"), do: "closed"
  def action("reopened"), do: "reopened"
  def action("assigned"), do: "assigned"
  def action("unassigned"), do: "unassigned"
  def action("labeled"), do: "labeled"
  def action("unlabeled"), do: "unlabeled"
  def action("synchronize"), do: "synchronize"
  def action(something), do: something
end
