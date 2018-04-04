defmodule Hipchat.Mixfile do
  use Mix.Project

  def project do
    [app: :hipchat,
     version: "0.1.1",
     elixir: "~> 1.0",
     deps: deps()]
  end

  def application do
    [applications: [:httpotion]]
  end

  defp deps do
    [ 
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.2"},
      {:httpotion, "~> 2.1.0"},
      {:json, "~> 0.3.0"}
    ]
  end
end
