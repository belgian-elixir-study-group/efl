# Your own protocol
defmodule BSON.Encoder do

  defprotocol TermEncoding do
    def encode(value)
  end

  defimpl TermEncoding, for: Float do
    def encode(value) do
      {<< 0x01 >>, << value :: size(64)-float-little >>}
    end
  end

  defimpl TermEncoding, for: Integer do

    def encode(value) when -0x80000000 <= value and value <= 0x80000000 do
      {<< 0x10 >>, <<(value) :: size(32)-integer-signed-little >>}
    end

    def encode(value) do
      {<< 0x12 >>, <<(value) :: size(64)-integer-signed-little >>}
    end
  end

  defimpl TermEncoding, for: Atom do
    def encode(true),  do: {<< 0x08 >>, << 0x01 >> }
    def encode(false), do: {<< 0x08 >>, << 0x00 >> }
    def encode(nil),   do: {<< 0x0A >>, <<  >> }
  end
end

# Integer
{header, value} = BSON.Encoder.TermEncoding.encode(23)
IO.puts header
IO.puts value

# Atoms
{header, value} = BSON.Encoder.TermEncoding.encode(true)
IO.puts header
IO.puts value

# Floats
{header, value} = BSON.Encoder.TermEncoding.encode(5.6)
IO.puts header
IO.puts value