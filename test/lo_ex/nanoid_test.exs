defmodule LoEx.NanoidTest do
  use ExUnit.Case
  doctest LoEx.Nanoid

  describe "generate" do
    test "generates a nanoid" do
      nanoid = LoEx.Nanoid.generate()
      assert String.length(nanoid) == 22
    end
  end

  describe "to_uuid" do
    test "converts a nanoid to a uuid" do
      assert LoEx.Nanoid.to_uuid("02qj8zjMDI9Pm0HC8208yl") ==
               "0182b66c-29e7-7ae8-b60e-4b669fe07c77"
    end
  end
end
