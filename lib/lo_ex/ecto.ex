defmodule LoEx.Ecto do
  @moduledoc """
  This module contains functions related to Ecto
  """

  import Ecto.Changeset

  @doc """
  Sets the default value for a field in a changeset if it is currently nil.

  ## Examples

      changeset = Ecto.Changeset.change(%User{}, %{})
      changeset = LoEx.Ecto.default(changeset, :age, fn -> 18 end)

  """
  def default(changeset, field, default_function) do
    case get_change(changeset, field) do
      nil -> put_change(changeset, field, default_function.())
      _ -> changeset
    end
  end
end
