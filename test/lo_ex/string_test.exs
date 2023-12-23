defmodule LoEx.StringTest do
  use ExUnit.Case
  doctest LoEx.String

  describe "index_of?" do
    test "finds the first index of a string" do
      assert LoEx.String.index_of?("hello world", "o") == 4
    end

    test "returns nil if no string is found" do
      assert LoEx.String.index_of?("hello world", "bye") == nil
    end
  end
end
