defmodule ExDatadogPlug.Mixfile do
  use Mix.Project
  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()

  def project do
    [
      app: :ex_datadog_plug,
      version: @version,
      elixir: "~> 1.4",
      description: description(),
      package: package(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # exdocs
      # Docs
      name: "ExDatadogPlug",
      source_url: "https://github.com/Tubitv/ex_datadog_plug",
      homepage_url: "https://github.com/Tubitv/ex_datadog_plug",
      docs: [
        main: "ExDatadog.Plug",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:statix, "> 0.0.0"},
      {:plug, "~> 1.5"},

      # dev & test
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:ex_doc, "~> 0.20", only: [:dev, :test]},
      {:mock, "~> 0.2.1", only: :test},
      {:pre_commit_hook, "~> 1.0.6", only: [:dev]}
    ]
  end

  defp description do
    """
    ex_datadog_plug helps to collect response time for your plug application.
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*", "version"],
      licenses: ["MIT"],
      maintainers: ["tyr.chen@gmail.com"],
      links: %{
        "GitHub" => "https://github.com/Tubitv/ex_datadog_plug",
        "Docs" => "https://hexdocs.pm/ex_datadog_plug"
      }
    ]
  end
end
