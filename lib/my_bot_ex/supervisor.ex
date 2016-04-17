defmodule MyBotEx.Supervisor do
  use Supervisor

  alias MyBotEx.Client.{Slack, Github}
  alias MyBotEx.Router

  def start_link, do: Supervisor.start_link __MODULE__, [], [name: __MODULE__]

  def init([]) do
    import Supervisor.Spec

    api_key = Application.get_env :my_bot_ex, :api_key

    children = [
      worker(Slack, [api_key, [name: Slack]]),
      worker(Github, [[name: Github]]),
      worker(Router, [[port: System.get_env("PORT")]])
    ]

    supervise children, strategy: :one_for_one
  end
end
