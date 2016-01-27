# Re-write Ex 3 from the main track a tail-recursive manner.
# You will have to add and pass around an accumulator variable
# which would containt the current counter

defmodule Parentheses do

  def balanced? (string) do
    characters = String.codepoints(string)

    count(characters, 0) == 0
  end

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
