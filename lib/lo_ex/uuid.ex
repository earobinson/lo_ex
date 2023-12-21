defmodule LoEx.UUID do
  @moduledoc """
  Documentation for `LoEx.Uuid`.
  """

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
end
