defmodule LoEx.Nanoid do
  @moduledoc """
  Documentation for `LoEx.Nanoid`.
  """

  use LoEx.Constants

  @doc """
  Generates a unique nanoid using UUID v7.

  Returns:
    A unique nanoid string.

  Examples:

    iex> LoEx.Nanoid.generate()

  """
  def generate do
    LoEx.UUID.v7()
    |> LoEx.UUID.to_nanoid()
  end

  @doc """
  Converts a nanoid to a UUID.

  ## Examples

      iex> LoEx.Nanoid.to_uuid("2aUyqjCzEIiEcYMKj7TZtw")
      "550e8400-e29b-41d4-a716-446655440000"

  """
  def to_uuid(nanoid) do
    nanoid

    with {:ok, number} <- base62_decode(nanoid) do
      {:ok, number} = number_to_uuid(number)
      number
    end
  end

  defp number_to_uuid(number) do
    number
    |> Integer.to_string(16)
    |> String.downcase()
    |> String.pad_leading(@uuid_length, "0")
    |> case do
      <<g1::binary-size(8), g2::binary-size(4), g3::binary-size(4), g4::binary-size(4),
        g5::binary-size(12)>> ->
        {:ok, "#{g1}-#{g2}-#{g3}-#{g4}-#{g5}"}

      other ->
        {:error, "got invalid base62 uuid; #{inspect(other)}"}
    end
  end

  defp base62_decode(string) do
    string
    |> String.split("", trim: true)
    |> Enum.reverse()
    |> Enum.reduce_while({:ok, {0, 0}}, fn char, {:ok, {acc, step}} ->
      case decode_base62_char(char) do
        {:ok, number} ->
          {:cont,
           {:ok, {acc + number * Integer.pow(unquote(length(@base62_alphabet)), step), step + 1}}}

        {:error, error} ->
          {:halt, {:error, error}}
      end
    end)
    |> case do
      {:ok, {number, _step}} -> {:ok, number}
      {:error, error} -> {:error, error}
    end
  end

  for {digit, idx} <- Enum.with_index(@base62_alphabet) do
    defp decode_base62_char(unquote(<<digit>>)), do: {:ok, unquote(idx)}
  end

  defp decode_base62_char(char), do: {:error, "got invalid base62 character; #{inspect(char)}"}
end
