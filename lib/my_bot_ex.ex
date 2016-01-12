defmodule MyBotEx do
  use Application

  def start(_type, _args), do: MyBotEx.Supervisor.start_link
end
