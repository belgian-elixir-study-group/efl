# running as a script:
$ elixir foo.exs

# REPL:
$ iex

# documentation directly from iex:
$ h(Enum)

# docs for Elixir:  http://elixir-lang.org/docs/stable/elixir/
# docs for Erlang:  http://erldocs.com

# == Types ==

Try these out in iex:

42
34.2

:an_atom


# Tuples
{:ok, "foo", "baz"}

# List
[1, 2, "three"]

# cons  (List construction)
[ 3 | [] ]

[1 | [2 | [3|[]]]]

# syntax sugar for the above
[1, 2, 3]

IO.inspect [1, 2, 3]


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


# Maps
states = %{ "AL" => "Alabama", "WI" => "Wisconsin" }

states["AL"]

person = %{ name: "Peter", surname: "Wisconsin", age: 26 }

person[:name]


# == Anonymous functions ==

fn (x, y) ->
  x + y
end

# Assign an anonymous function to a variable

sum = fn (x, y) -> x + y end

# And call it:

sum.(34, 2)


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

# Calling Erlang functions is very easy:

:os.timestamp

:timer.sleep(1000)


# You can rewrite this expression:
Integer.to_string(Enum.sum(Enum.map(1..10, fn(x) -> x+1 end  )))

# using the pipe operator:
1..10 |> Enum.map(fn(x) -> x+1 end)   |> Enum.sum |> Integer.to_string

