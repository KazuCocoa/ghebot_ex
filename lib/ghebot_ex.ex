defmodule GhebotEx do
  @token Application.get_env :ghebot_ex, :token

  alias Tentacat, as: TC
  alias GhebotEx.PullRequest


  def client(), do: TC.Client.new %{}
  def client(:token), do: TC.Client.new %{access_token: @token}

  def user(name), do: TC.Users.find(name)
  def user(client, :me) when is_atom(:me), do: TC.Users.me(client)
  def user(client, name) when is_bitstring(name), do: TC.Users.find(name, client)


  def request() do
    header = %{x_github_event: "pull_request"}
    event(header.x_github_event)
  end

  # TODO: use `defprotocol` and `defimp`
  # defp event("commit_comment"), do: CommitComment.action "commit_comment"
  # defp event("fork"), do: Fork.action "fork"
  # defp event("gollum"), do: Gollum.action "gollum"
  # defp event("issue_comment"), do: IssueCmment.action "issue_comment"
  # defp event("issues"), do: Issues.action "issues"
  # defp event("pull_request_review_comment"), do: PullRequestReviewComment.action "pull_request_review_comment"
  defp event("pull_request"), do: PullRequest.action "opened"

end
