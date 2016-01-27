# Find the library functions to do the following, and then use each in iex.

# – Get the value of an operating system environment variable. (PATH for instance)

IO.inspect System.get_env("PATH")

# – Return the extension component of a file name (so return .exs if given "dave/test.exs")

IO.inspect Path.extname("dave/test.exs")

# – Return the current working directory of the process.

IO.inspect System.cwd

# – Find a module for keyword lists. Find a function which would help
# you write code for  merging
# two keyword lists where values are numbers, and if the same key is
# present in both keyword lists, the resulting key value is the
# multiplication of  the  values in the two source lists


IO.inspect Keyword.merge([a: 10, b: 20], [a: 3, d: 4], fn (_k, v1, v2) ->
  v1 * v2
end)
