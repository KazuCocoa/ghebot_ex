defmodule MyBotEx.User do
  alias Tentacat, as: TC

  def user(name), do: TC.Users.find(name)
  def user(client, :me) when is_atom(:me), do: TC.Users.me(client)
  def user(client, name) when is_bitstring(name), do: TC.Users.find(name, client)
end
