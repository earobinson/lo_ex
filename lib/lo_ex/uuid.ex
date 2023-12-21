defmodule LoEx.UUID do
  @moduledoc """
  Documentation for `LoEx.Uuid`.
  """

  use LoEx.Constants

  def v1 do
    Uniq.UUID.uuid1()
  end

  def v3 do
    Uniq.UUID.uuid3(:oid, LoEx.Pid.to_string(self()))
  end

  def v4 do
    Uniq.UUID.uuid4()
  end

  def v5 do
    Uniq.UUID.uuid5(:oid, LoEx.Pid.to_string(self()))
  end

  def v6 do
    Uniq.UUID.uuid6()
  end

  def v7 do
    Uniq.UUID.uuid7()
  end

  for {digit, idx} <- Enum.with_index(@base62_alphabet) do
    defp base62_encode(unquote(idx)), do: unquote(<<digit>>)
  end

  defp base62_encode(number) do
    base62_encode(div(number, unquote(length(@base62_alphabet)))) <>
      base62_encode(rem(number, unquote(length(@base62_alphabet))))
  end

  @doc """
  Converts a UUID to a nanoid.

  ## Examples

      iex> LoEx.UUID.to_nanoid("550e8400-e29b-41d4-a716-446655440000")
      "2aUyqjCzEIiEcYMKj7TZtw"

  """
  def to_nanoid(uuid) do
    "#{uuid}"
    |> String.replace("-", "")
    |> String.to_integer(16)
    |> base62_encode()
    |> String.pad_leading(@base62_uuid_length, "0")
  end
end
