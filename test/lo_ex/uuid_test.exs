defmodule LoEx.UUIDTest do
  use ExUnit.Case
  doctest LoEx.UUID

  describe "UUID v1" do
    test "generates a v1 uuid" do
      uuid = LoEx.UUID.v1()
      assert String.at(uuid, 14) == "1"
    end
  end

  describe "UUID v3" do
    test "generates a v3 uuid" do
      uuid = LoEx.UUID.v3()
      assert String.at(uuid, 14) == "3"
    end
  end

  describe "UUID v4" do
    test "generates a v4 uuid" do
      uuid = LoEx.UUID.v4()
      assert String.at(uuid, 14) == "4"
    end
  end

  describe "UUID v5" do
    test "generates a v5 uuid" do
      uuid = LoEx.UUID.v5()
      assert String.at(uuid, 14) == "5"
    end
  end

  describe "UUID v6" do
    test "generates a v6 uuid" do
      uuid = LoEx.UUID.v6()
      assert String.at(uuid, 14) == "6"
    end
  end

  describe "UUID v7" do
    test "generates a v7 uuid" do
      uuid = LoEx.UUID.v7()
      assert String.at(uuid, 14) == "7"
    end
  end
end
