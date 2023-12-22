defmodule LoEx.Ecto.BinaryNanoid do
  @doc """
  Generates base62 encoded nanoid UUIDv7.

  ## Examples

      @primary_key {:id, LoEx.Ecto.BinaryNanoid, autogenerate: true}
      @foreign_key_type LoEx.Ecto.BinaryNanoid
  """
  use Ecto.ParameterizedType

  @impl true
  def init(opts) do
    schema = Keyword.fetch!(opts, :schema)
    field = Keyword.fetch!(opts, :field)
    uniq = Uniq.UUID.init(schema: schema, field: field, version: 7, default: :raw, dump: :raw)

    case opts[:primary_key] do
      true ->
        %{
          primary_key: true,
          schema: schema,
          uniq: uniq
        }

      _any ->
        %{
          schema: schema,
          field: field,
          uniq: uniq
        }
    end
  end

  @impl true
  def type(_params), do: :uuid

  @impl true
  def cast(nil, _params), do: {:ok, nil}

  def cast(data, params) do
    with {:ok, _uuid} <- slug_to_uuid(data, params) do
      {:ok, data}
    else
      _ -> :error
    end
  end

  defp slug_to_uuid(string, _params) do
    {:ok, LoEx.Nanoid.to_uuid(string)}
  end

  @impl true
  def load(data, loader, params) do
    case Uniq.UUID.load(data, loader, params.uniq) do
      {:ok, nil} -> {:ok, nil}
      {:ok, uuid} -> {:ok, LoEx.UUID.to_nanoid(uuid)}
      :error -> :error
    end
  end

  @impl true
  def dump(nil, _, _), do: {:ok, nil}

  def dump(slug, dumper, params) do
    case slug_to_uuid(slug, params) do
      {:ok, uuid} -> Uniq.UUID.dump(uuid, dumper, params.uniq)
      {:error, _} -> :error
    end
  end

  @impl true
  def autogenerate(_params) do
    LoEx.Nanoid.generate()
  end

  @impl true
  def embed_as(format, params), do: Uniq.UUID.embed_as(format, params.uniq)

  @impl true
  def equal?(a, b, params), do: Uniq.UUID.equal?(a, b, params.uniq)
end
