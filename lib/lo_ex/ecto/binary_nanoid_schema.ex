defmodule LoEx.Ecto.BinaryNanoidSchema do
  @moduledoc """
  This module defines the default schema settings for schema modules
  in Sheet.

  Primary and foreign keys are prefixed UUIDs.

  ## Usage

      defmodule Sheet.Accounts.Account do
        use Sheet.Schema

        # ...
      end
  """

  defmacro __using__(_opts \\ []) do
    quote do
      use Ecto.Schema

      @primary_key {:id, LoEx.Ecto.BinaryNanoid, autogenerate: true}
      @foreign_key_type LoEx.Ecto.BinaryNanoid

      @type t :: %__MODULE__{}
    end
  end
end
