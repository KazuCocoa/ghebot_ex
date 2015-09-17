defmodule GhebotEx do
  @token Application.get_env :ghebot_ex, :token

  import Tentacat
  alias Tentacat, as: TC

  def client(), do: TC.Client.new %{}
  def client(:token), do: TC.Client.new %{access_token: @token}

  def user(name), do: TC.Users.find(name)
  def user(client, :me) when is_atom(:me), do: TC.Users.me(client)
  def user(client, name) when is_bitstring(name), do: TC.Users.find(name, client)


end
