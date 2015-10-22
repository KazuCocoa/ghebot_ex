defmodule MyBotEx.Client.Github.Event do
  alias Tentacat, as: TC

  def issue(client, owner, repo, issue_number, options \\ []) do
    TC.get "repos/#{owner}/#{repo}/issues/#{issue_number}/events", client
  end

  def issues(client, owner, repo, options \\ []) do
    TC.get "repos/#{owner}/#{repo}/issues/events", client
  end
end
