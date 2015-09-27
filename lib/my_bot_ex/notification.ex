defmodule MyBotEx.Notification do
  alias Tentacat, as: TC

  def notification(client), do: TC.get "notifications", client
end
