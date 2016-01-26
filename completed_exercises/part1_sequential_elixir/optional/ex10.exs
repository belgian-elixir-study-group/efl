# Re-write the same function in a tail-recursive manner.

defmodule Parentheses do

  def balanced? (string) do
    characters = String.codepoints(string)

    count(characters, 0) == 0
  end

  defp count([], accu), do: accu

  defp count(["(" | tail], accu), do: count(tail, accu + 1)

  defp count([")" | tail], accu), do: count(tail, accu - 1)

  defp count([_ | tail], accu), do: count(tail, accu)

end

ExUnit.start

defmodule ParenthesesTest do
  use ExUnit.Case

  test "opening parentheses and closing parentheses are calculated correctly" do
    assert  Parentheses.balanced?("wçih((rwkèdfn)slé)rЮh")
    assert  ! Parentheses.balanced?("wçih((rwëkЭdfn)sle)r)h")
    assert  ! Parentheses.balanced?("w((eih((rwödfn)sle)r)h")
  end

end
