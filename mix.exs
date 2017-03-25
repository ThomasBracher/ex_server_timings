defmodule ExServerTimings.Mixfile do
  use Mix.Project

  @version "0.1.1"

  def project do
    [
      app: :ex_server_timings,
      version: @version,
      elixir: "~> 1.3",
      name: "Ex Server Timings",
      description: "Plug Elixir performance in your requests",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:ex_doc, "~> 0.15", only: :docs},
      {:inch_ex, ">= 0.0.0", only: :docs},
      {:plug, "~> 1.0"}
    ]
  end

  defp package do
    %{licenses: ["MIT"],
      maintainers: ["Thomas Bracher"],
      links: %{"GitHub" => "https://github.com/ThomasBracher/ex_server_timings"}}
  end
end
