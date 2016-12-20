defmodule PhoenixExceptional.Mixfile do
  use Mix.Project

  def application, do: [applications: [:logger]]
  def project do
    [
      app:     :phoenix_exceptional,
      name:    "Phoenix/Exceptional",
      description: "Exceptional error/exception helpers for Phoenix",

      version: "1.0.0",
      elixir:  "~> 1.3",

      source_url:   "https://github.com/expede/phoenix_exceptional",
      homepage_url: "https://github.com/expede/phoenix_exceptional",

      package: [
        maintainers: ["Brooklyn Zelenka"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/expede/phoenix_exceptional"}
      ],

      aliases: ["quality": ["test", "credo --strict"]],

      build_embedded:  Mix.env == :prod,
      start_permanent: Mix.env == :prod,

      deps: [
        {:exceptional,  "~> 2.0"},
        {:phoenix_html, "~> 2.9"},

        {:credo, "~> 0.5",  only: [:dev, :test]},

        {:dialyxir, "~> 0.3",  only: :dev},
        {:earmark,  "~> 1.0",  only: :dev},
        {:ex_doc,   "~> 0.14", only: :dev},

        {:inch_ex, "~> 0.5",  only: [:dev, :docs, :test]}
      ],

      docs: [
        # logo: "./branding/logo.png",
        extras: ["README.md"],
        main: "readme"
      ]
    ]
  end
end
