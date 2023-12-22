defmodule LoEx.EctoTest do
  use ExUnit.Case

  doctest LoEx.Ecto

  defmodule User do
    use Ecto.Schema
    import Ecto.Changeset

    schema "users" do
      field(:age, :integer)

      timestamps(type: :utc_datetime)
    end

    @doc false
    def changeset(event, attrs) do
      event
      |> cast(attrs, [:age])
      |> LoEx.Ecto.default(:age, fn -> 18 end)
      |> validate_required([:age])
    end
  end

  describe "default" do
    test "sets a default if there is not one" do
      changeset = User.changeset(%User{}, %{})
      assert Map.get(changeset.changes, :age) == 18
    end

    test "does not set a default if an atom value is set" do
      changeset = User.changeset(%User{}, %{age: 19})
      assert Map.get(changeset.changes, :age) == 19
    end

    test "does not set a default if a string value is set" do
      changeset = User.changeset(%User{}, %{"age" => 20})
      assert Map.get(changeset.changes, :age) == 20
    end
  end
end
