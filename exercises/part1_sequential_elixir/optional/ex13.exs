# Write a converter of Roman numerals to decimal numerals.

# You need to compare each digit with the next digit (if any).
# If the first one is smaller the next one, the value of the first
# digit is subtracted from the result, in all other cases its value
# is added

# XIV :
# X is bigger than I, so:  +10
# I is smaller than V, so: -1
# V is the last digit, so: +5
# 10 - 1 + 5 = 14

#    USE CHARACTER LISTS, NOT CODEPOINTS!!!
defmodule RomanNumeral do

  def convert

  defp roman_digit_to_decimal(digit) do
    case digit do
      ?I ->    1
      ?V ->    5
      ?X ->   10
      ?L ->   50
      ?C ->  100
      ?D ->  500
      ?M -> 1000
    end
  end
end

ExUnit.start

defmodule RomanNumeralTest do
  use ExUnit.Case

  test "convertion works" do
    assert RomanNumeral.convert('XX')     == 20
    assert RomanNumeral.convert('XXII')   == 22
    assert RomanNumeral.convert('IV')     == 4
    assert RomanNumeral.convert('V')      == 5
    assert RomanNumeral.convert('VI')     == 6
    assert RomanNumeral.convert('VII')    == 7
    assert RomanNumeral.convert('IX')     == 9
    assert RomanNumeral.convert('XI')     == 11
    assert RomanNumeral.convert('MDDXIV') == 2014
  end
end
