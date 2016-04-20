defmodule MyBotEx.Supervisor do
  use Supervisor

  alias MyBotEx.Client.{Slack, Github}
  alias MyBotEx.Router

  def start_link, do: Supervisor.start_link __MODULE__, [], [name: __MODULE__]

  def init([]) do
    import Supervisor.Spec

    api_key = Application.get_env :my_bot_ex, :api_key

    port = case System.get_env "PORT" do
             p when p == nil -> nil
             p when not is_integer(p) -> String.to_integer(p)
             p -> p
           end

    children = [
      worker(Slack, [api_key, [name: Slack]]),
      worker(Github, [[name: Github]]),
      worker(Router, [[port: port]])
    ]

    supervise children, strategy: :one_for_one
  end
end
