# Phoenix/Exceptional

[Exceptional](https://hex.pm/packages/exceptional) error/exception helpers for Phoenix

[![Build Status](https://travis-ci.org/expede/phoenix_exceptional.svg?branch=master)](https://travis-ci.org/expede/phoenix_exceptional) [![Inline docs](http://inch-ci.org/github/expede/phoenix_exceptional.svg?branch=master)](http://inch-ci.org/github/expede/phoenix_exceptional) [![Deps Status](https://beta.hexfaktor.org/badge/all/github/expede/phoenix_exceptional.svg)](https://beta.hexfaktor.org/github/expede/phoenix_exceptional) [![hex.pm version](https://img.shields.io/hexpm/v/phoenix_exceptional.svg?style=flat)](https://hex.pm/packages/phoenix_exceptional) [![API Docs](https://img.shields.io/badge/api-docs-yellow.svg?style=flat)](http://hexdocs.pm/phoenix_exceptional/) [![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/expede/phoenix_exceptional/blob/master/LICENSE)

## Installation

Add `phoenix_exceptional` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:phoenix_exceptional, "~> 1.0"}]
end
```

## Views

Automated rendering of error views based on the `message` field on exception structs.
This is often sufficient for simple JSON cases and pre-release HTML. It is recommended to write custom error views before production to give your users as much detail as possible in the user friendliest way that their content type allows.

```elixir
# /web/views/error_view.ex

defmodule AwesomeApp do
  use Phoenix.Exceptional

  defrender :error, for: 401, do: "Not authorized"
  defrender :error, for: 404, only: [:json], do: "Data not found"
  defrender :error, for: 422, except: [:html] do: "Unprocessible entity"
  defrender :error, for: 500, do: "Server internal error"
end
```

```bash
# Example JSON Error Response

404 %{error: "Data not found", reason: "Photo deleted"}

# Example HTML Error Response

500 "Server internal error"
```
