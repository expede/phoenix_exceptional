# Phoenix/Exceptional

Exceptional error/exception helpers for Phoenix

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
