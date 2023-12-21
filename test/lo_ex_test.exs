defmodule LoExTest do
  use ExUnit.Case
  doctest LoEx

  test "greets the world" do
    assert LoEx.hello() == :world
  end
end
