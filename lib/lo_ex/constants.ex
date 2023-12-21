defmodule LoEx.Constants do
  defmacro __using__(_) do
    quote do
      @base62_alphabet ~c"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
      @uuid_length 32
      @base62_uuid_length 22
    end
  end
end
