defmodule MyBotEx.Notification do
  alias Tentacat, as: TC

  def notification(client), do: TC.get "notifications", client

  def notification(client, owner, repo) do
    TC.get "repos/#{owner}/#{repo}/notifications", client
  end
end
