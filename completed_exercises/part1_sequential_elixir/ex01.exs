defmodule FB do

  # Write a function that takes three arguments.
  # If the first two are zero, return “FizzBuzz”.
  # If the first is zero, return “Fizz”.
  # If the second is zero return “Buzz”.
  # Otherwise return the third argument.
  # Use pattern matching, look up the cheatsheet
  def fizz_buzz_base(0, 0, _), do: "FizzBuzz"
  def fizz_buzz_base(0, _, _), do: "Fizz"
  def fizz_buzz_base(_, 0, _), do: "Buzz"
  def fizz_buzz_base(_, _, a), do: a


  # The operator rem(a, b) returns the remainder after dividing a by b.
  # Write a function that takes a single integer (n) and
  # which calls the function in the previous exercise,
  # passing it rem(n,3), rem(n,5), and n. Call it 7 times with
  # the arguments 10, 11, 12, etc.
  # You should get “Buzz, 11, Fizz, 13, 14, FizzBuzz, 16”.
  # (Yes, it’s a FizzBuzz solution without if).
  def fizz_buzz(n) do
    fizz_buzz_base(rem(n, 3), rem(n, 5), n)
  end
end

ExUnit.start

defmodule SumTest do
  use ExUnit.Case

  test "fizz_buzz_base" do
    assert FB.fizz_buzz_base(0, 0, 1)    == "FizzBuzz"
    assert FB.fizz_buzz_base(0, 100, 21) == "Fizz"
    assert FB.fizz_buzz_base(42, 0, 11)  == "Buzz"
    assert FB.fizz_buzz_base(42, 12, 11) == 11
  end

  # test "fizz_buzz" do
  #   assert FB.fizz_buzz(10)    == "Buzz"
  #   assert FB.fizz_buzz(11)    == 11
  #   assert FB.fizz_buzz(12)    == "Fizz"
  #   assert FB.fizz_buzz(13)    == 13
  #   assert FB.fizz_buzz(14)    == 14
  #   assert FB.fizz_buzz(15)    == "FizzBuzz"
  # end
end
