defmodule MyBotEx.Client.Github.Comment do
  alias Tentacat, as: TC

  def issue(client, owner, repo, issue_number, options \\ []), do: TC.get "repos/#{owner}/#{repo}/issues/#{issue_number}/comments", client
  def issues(client, owner, repo, options \\ []), do: TC.get "/repos/#{owner}/#{repo}/issues/comments", client
end
