defmodule MyBotEx.Mixfile do
  use Mix.Project

  def project do
    [app: :my_bot_ex,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,
     aliases: aliases]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      applications: [:tzdata, :tentacat, :slack],
      mod: {MyBotEx, []}
    ]
  end

  def aliases do
    [bot: ["run --no-halt"]]
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
      {:tentacat, "~> 0.3"},
      {:slack, "~> 0.4.0"},
      {:websocket_client, github: "jeremyong/websocket_client"},
      {:reporter, "~> 0.3"},
      {:timex, "~> 2.0"},
      {:revision_plate_ex, "~> 0.1.0"},
      {:current_streak_ex, "~> 0.1"},
      {:github_trend_ex, "~> 0.1"},
      {:ex_parameterized, "~> 1.0", only: :test}
    ]
  end
end
