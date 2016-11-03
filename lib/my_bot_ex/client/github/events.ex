defmodule MyBotEx.Client.Github.Event do
  alias Tentacat, as: TC

  def issue(client, owner, repo, issue_number, _options \\ []), do: TC.get "repos/#{owner}/#{repo}/issues/#{issue_number}/events", client
  def issues(client, owner, repo, _options \\ []), do: TC.get "repos/#{owner}/#{repo}/issues/events", client
end
