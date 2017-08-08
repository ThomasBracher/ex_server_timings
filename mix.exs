defmodule ExServerTimings.Mixfile do
  use Mix.Project

  @version "0.2.3"

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

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:inch_ex, ">= 0.0.0", only: :dev},
      {:plug, "~> 1.0"}
    ]
  end

  defp package do
    %{licenses: ["MIT"],
      maintainers: ["Thomas Bracher"],
      links: %{"GitHub" => "https://github.com/ThomasBracher/ex_server_timings"}}
  end
end
