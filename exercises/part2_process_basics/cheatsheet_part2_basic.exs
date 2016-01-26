# PID
IO.inspect self


# Start a process and return its PID
pid = spawn(fn -> 1 + 2 end)

IO.puts Process.alive?(pid)

# Starts and link process with parent, exception will be propagated
pid = spawn_link(fn -> 1 + 2 end)

IO.puts Process.alive?(pid)

# Blocks and expects any message, bails out after 500ms if no message was received
receive do
  _ -> "catch all"
after
  500 -> IO.puts "timed out!"
end

# show in iex
# Send a bunch of messages to the current process
send self, {:will_be_ignored, "because it's not matched", 123, [:x, {:y, :z}]}
send self, {:hello, "world"}
send self, {:hello, "world, again"}

# Fetch first :hello message from the current process mailbox
receive do
  {:hello, name} -> IO.puts "Hello #{name}!"
end

# Fetch second :hello message from the current process mailbox
receive do
  {:hello, name} -> IO.puts "Hello #{name}!"
end

