# Write a function which returns true if a string has the same number of
# opening and closing parentheses:

# Scan characters one by one and increment a number (initially 0) by 1
# when you see "(", decrement in case of a ")"

# This is how you pattern match a list into a list head and a list tails right in function declaration:
#
#   def foo([h | t]) do
#   end
#
#   foo([1,2,3,4])
#
#   h will be 1, t will be [2,3,4]

defmodule Parentheses do

  def balanced? (string) do
    characters = String.codepoints(string)

    count(characters) == 0
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
