# running as a script:
$ elixir foo.exs

# REPL:
$ iex

# compiling
$ elixirc foo.ex

# compiling from iex
$ c("foo.ex")

# documentation directly from iex:
$ h(Enum)

# docs for Elixir:  http://elixir-lang.org/docs/stable/elixir/
# docs for Erlang:  http://erldocs.com

# == Types ==

Thy these out in iex:

42
34.2

:an_atom

~r{^[Hh]ello$}

# Ranges
1..23

IO.inspect self

# Tuples
{:ok, "foo", "baz"}

# List
[1, 2, "three"]

# cons  (List construction)
[ 3 | [] ]

[1 | [2 | [3|[]]]]

# syntax sugar for the above
[1, 2, 3]

# list concatenations
[1,2,3] ++ [4,5,6]

# member of a list
1 in [1, 2, 3 ,4]

# contatenate strings (binaries)
"foo" <> "baz"  #=> "foobaz"

lastname = "Peterson"
"Hello Mr #{lastname}"

# Keyword list: a list of two-element tuples where the first element is an atom
[ {:name, "Olivier"}, {:age, 42}, {:eats, "beans"} ]

# syntax sugar
[ name: "Olivier", age: 42, eats: "beans" ]

# Keyword list in a function call
MagicWand.save(world, [ {:immediately, true}, {:ark, "Noah's"} ])

# the same:
MagicWand.save(world, immediately: true, ark: "Noah's")

# Maps
states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }

states["AL"]

person = %{ name: "Peter", surname: "Wisconsin", age: 26 }

person[:name]
person.name

# generates a new map based on an existing map
another_person = %{ person | age: 27 }

# == Pattern matching ==

{:ok, c, d} = {:ok, 10, 42}

{:ok, c, _} = {:ok, 10, 42}

[head | tail] = [1, 2, 3, 4]

[head, head2 | tail] = [1, 2, 3, 4]

[head, head2 | tail] = [1, 2, 3, 4]


a = 4
{:ok, a, b} = {:ok, 56, 0}
{:ok, ^a, b} = {:ok, 56, 0} # MatchError !
{:ok, ^a, b} = {:ok, 4, 0}

# == Anonymous functions ==

fn (x, y) ->
  x + y
end

# Assign an anonymous function to a variable

sum = fn (x, y) -> x + y end

# And call it:

sum.(34, 2)

# You can rewrite this function like this:

sum = &( &1 + &2 )
# don't overuse this..


# an anonymous function with pattern matching
what_is_it = fn
  [] -> "an empty list"
  [_head | [] ] -> "a  list with one element"
  [_head |  _ ] -> "a  list with more than one element"
  {_, _} -> "a tuple with 2 elements"
  _ -> "I don't know, leave me alone!"
end

what_is_it.([])
what_is_it.([2])
what_is_it.([2, 34])
what_is_it.([2, 34, 1])
what_is_it.({1,2})
what_is_it.(:something)

# == Modules and functions ==

# Yes, you can copy-paste modules into iex and it will work :)
# (it doesn't in Erlang + erl)

defmodule Foo do
  def say_hello(name) do
    "Hello, #{name}"
  end
end

defmodule Foo do
  # if your function is short:
  def say_hello(name), do: "Hello, #{name}"
end

Foo.say_hello("Jack")

# Multiple clauses of the same function
defmodule Factorial do
  def of(0), do: 1
  def of(n), do: n * of(n-1)
end

# Guards
defmodule Factorial do
  def of(0), do: 1
  def of(n) when is_integer(n) when n > 0 do
    n * of(n-1)
  end
end

# A private function
defmodule Foo do
  defp a_private_function do
    ...
  end
end

# Modules inside modules
defmodule Outer do
  defmodule Inner do
    def inner_func do
    end
  end

  def outer_func do
    Inner.inner_func
  end
end

# Calling them
Outer.outer_func
Outer.Inner.inner_func

# Calling Erlang functions is very easy:

:os.timestamp

:timer.sleep(1000)


# import

defmodule Mix.Tasks.Doctest do
  def run do
  end
end

defmodule ImportExample do

  import Mix.Tasks.Doctest
  # import Mix.Tasks.Doctest, only: [ run: 0 ]

  def test do
    run() # This function is from Mix.Tasks.Doctest
  end
end

# alias

defmodule AliasExample do

  alias Mix.Tasks.Doctest, as: Doctest

  def test do
    Doctest.run()
  end
end

# Tail-recursive vs. non-tail-recursive

# non-tail-recursive factorial:
defmodule Factorial do
  def of(0), do: 1

  def of(n)  when n > 0 do
    n * of(n-1)
  end
end

# tail-recursive factorial:
#  A call is tail-recursive if nothing has to be done after
# the call returns i.e. when the call returns,
# the returned value is immediately returned from the
# calling function
# This allows for some optimization.
# With an appropriately written compiler, you should
# never have a stack overflow snicker with a tail recursive call.
# Simply reuse the current stack frame for the next recursive step.
defmodule Factorial do

  def of(n) when n > 0 do
    calculate(n, 1)
  end

  defp calculate(0, accu), do: accu

  defp calculate(n, accu) do
    calculate(n - 1, accu * n)
  end
end

# You can rewrite this expression:
Integer.to_string(Enum.sum(Enum.map(1..10, &(&1 + 1))))

# using the pipe operator:
1..10 |> Enum.map(&(&1 + 1))   |> Enum.sum |> Integer.to_string


"foo" is a string, in Erlang terminology this is a UTF-8 encoded binary

You can also use lists of integers to work with one byte encodings. Try these in iex:

?a
?b
?c

[?a, ?b, ?c]

'abc'

[97, 98, 99]

is_list('abc)

[head | tail ] = 'Hello'

tail

