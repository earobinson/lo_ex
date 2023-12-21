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

  describe "to_nanoid" do
    setup do
      %{
        uuids: %{
          nil => "00000000-0000-0000-0000-000000000000",
          1 => "92fef5d6-c639-11eb-b8bc-0242ac130003",
          # generated in the :dns namespace, name "test"
          3 => "45a113ac-c7f2-30b0-90a5-a399ab912716",
          4 => "e5a4a3c3-45a7-4d5a-9809-e253a6ff8da2",
          # generated in the :dns namespace, name "test"
          5 => "4be0643f-1d98-573b-97cd-ca98a65347dd",
          6 => "1e7126af-f130-6780-adb4-8bbe7368fc2f",
          7 => "0182b66c-29e7-7ae8-b60e-4b669fe07c77"
        },
        nanoids: %{
          nil => "0000000000000000000000",
          1 => "4TNObmjsOQepLv93GfuHi7",
          3 => "27O58d9wCLXM1oIeS9dXug",
          4 => "6zKTyJTThjfF83bgQh5lyM",
          5 => "2JAyFT8G5qNQKnU3e9ZV0f",
          6 => "0vRTlBTpNXuuJL4SppQlYt",
          7 => "02qj8zjMDI9Pm0HC8208yl"
        }
      }
    end

    test "converts a uuid to a nanoid", %{uuids: uuids, nanoids: nanoids} do
      assert LoEx.UUID.to_nanoid(uuids[nil]) == nanoids[nil]
      assert LoEx.UUID.to_nanoid(uuids[1]) == nanoids[1]
      assert LoEx.UUID.to_nanoid(uuids[3]) == nanoids[3]
      assert LoEx.UUID.to_nanoid(uuids[4]) == nanoids[4]
      assert LoEx.UUID.to_nanoid(uuids[5]) == nanoids[5]
      assert LoEx.UUID.to_nanoid(uuids[6]) == nanoids[6]
      assert LoEx.UUID.to_nanoid(uuids[7]) == nanoids[7]
    end
  end
end
