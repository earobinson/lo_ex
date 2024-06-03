defmodule LoEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :lo_ex,
      version: "0.0.2",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Library for common Elixir functions.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE"],
      maintainers: ["Edward Robinson"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/earobinson/loex"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 1.0", only: [:dev, :test], runtime: false},
      {:uniq, "~> 0.6.1"},
      {:ex_doc, "~> 0.34.0", only: :dev},
      {:ecto, "~> 3.11"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
