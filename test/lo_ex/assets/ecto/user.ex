defmodule LoEx.Assets.Ecto.User do
  use Ecto.Schema
  # import Ecto.Changeset

  schema "users" do
    field(:email, :string)
    field(:age, :integer)

    timestamps(type: :utc_datetime)
  end

  # @doc false
  # def changeset(event, attrs) do
  #   event
  #   |> cast(attrs, [:body, :entity_id, :inserted_by_id, :updated_by_id])
  #   |> assoc_constraint(:entity)
  #   |> assoc_constraint(:inserted_by)
  #   |> assoc_constraint(:updated_by)
  #   |> validate_required([:body, :entity_id, :inserted_by_id, :updated_by_id])
  # end
end
