defmodule MyBotExTest do
  use ExUnit.Case

  test "workers work well" do
    actual = Supervisor.which_children MyBotEx.Supervisor
    [{_, pid1, _, _}, {_, pid2, _, _}, {_, pid3, _, _}] = actual
    expect = [{MyBotEx.Router, pid1, :worker, [MyBotEx.Router]},
               {MyBotEx.Client.Github, pid2, :worker, [MyBotEx.Client.Github]},
               {MyBotEx.Client.Slack, pid3, :worker, [MyBotEx.Client.Slack]}]

    assert actual == expect
  end

end
