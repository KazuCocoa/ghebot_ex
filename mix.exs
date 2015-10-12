defmodule MyBotEx.Mixfile do
  use Mix.Project

  def project do
    [app: :my_bot_ex,
     version: "0.0.1",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:tentacat, :slack],
      mod: {MyBotEx, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:tentacat, "~> 0.2.0"},
      {:slack, "~> 0.2"},
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:reporter, "~> 0.2.5"},
      {:ex_parametarized, "~> 0.3.1"}
    ]
  end
end
