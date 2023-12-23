defmodule LoEx.String do
  @moduledoc """
  Documentation for `LoEx.String`.
  """

  use LoEx.Constants

  @doc """
  Returns the index of the first occurrence of the pattern in the string, or nil if not found.

  ## Examples

      iex> LoEx.String.index_of?("hello world", "world")
      6

      iex> LoEx.String.index_of?("hello world", "foo")
      nil

  """
  def index_of?(string, pattern) do
    case :binary.match(string, pattern) do
      :nomatch -> nil
      {index, _} -> index
    end
  end
end
