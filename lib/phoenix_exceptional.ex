defmodule Phoenix.Exceptional do
  @moduledoc ~S"""
  Top-level `use` aliases

  In almost all cases, you want:

  use Phoenix.Exceptional
  """

  defmacro __using__(opts \\ []) do
    quote bind_quoted: [opts: opts]  do
      use Phoenix.Exceptional.ViewHelper, opts
    end
  end
end
