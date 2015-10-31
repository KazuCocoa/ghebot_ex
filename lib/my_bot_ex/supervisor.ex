defmodule MyBotEx.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link __MODULE__, [], [name: __MODULE__]
  end

  def init([]) do
    import Supervisor.Spec

    api_key = Application.get_env :my_bot_ex, :api_key

    children = [
      worker(MyBotEx.Client.Slack, [api_key, [name: MyBotEx.Client.Slack]]),
      worker(MyBotEx.Client.Github, [[name: MyBotEx.Client.Github]])
    ]

    supervise children, strategy: :one_for_one
  end
end
