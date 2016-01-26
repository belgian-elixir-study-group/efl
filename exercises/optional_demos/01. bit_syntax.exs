
defmodule BitSyntaxExample do
  def encode(value) when -0x80000000 <= value and value <= 0x80000000 do
    << 0x10 ,  (value) :: size(32)-integer-signed-little >>
  end

  def encode(value) do
    << 0x12 , (value) :: size(64)-integer-signed-little >>
  end
end

IO.inspect BitSyntaxExample.encode(12)
IO.inspect BitSyntaxExample.encode(12_345)
IO.inspect BitSyntaxExample.encode(123_456_789_012)
