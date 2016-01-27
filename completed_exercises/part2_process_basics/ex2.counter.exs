# Add two more features to our counter:
#
# 1) A message to decrement a counter
# 2) A message to stop the process
#
#  Make baby steps and uncomment the test cases as you make progress
#

defmodule Counter do

  @doc "Creates a new counter, initialized to 0"
  def start do
    spawn_link(fn -> loop(0) end)
  end

  @doc "Increments the given counter by 1"
  def inc(counter) do
    send counter, {self, :inc}
  end

  @doc "Decrements the given counter by 1"
  def dec(counter) do
    send counter, {self, :dec}
  end

  @doc "Returns the current value of the given counter"
  def value(counter) do
    send counter, {self, :val}
    get_value counter
  end

  @doc "Destroy the given counter"
  def terminate(counter) do
    send counter, {self, :bye}
    receive do
      {^counter, :stopped} -> :ok
    after
      500 -> :timeout
    end
  end

  defp get_value(counter) do
    receive do
      {^counter, :ok, val} ->
        val
    end
  end

  defp loop(counter) do
    receive do
      {_, :inc} ->
        loop(counter + 1)
      {_, :dec} ->
        loop(counter - 1)
      {sender, :val} ->
        send sender, {self, :ok, counter}
        loop(counter)
      {sender, :bye} ->
        send sender, {self, :stopped}
    end
  end

end

ExUnit.start

defmodule CounterTest do
  use ExUnit.Case

  #
  # Step 1
  #

  test "counter starts at 0" do
    pid = Counter.start
    assert 0 == Counter.value(pid)
  end

  test "incrementing" do
    pid = Counter.start
    Counter.inc(pid)
    Counter.inc(pid)
    Counter.inc(pid)
    assert 3 == Counter.value(pid)
  end

  test "multiple counters" do
    pid1 = Counter.start
    pid2 = Counter.start
    pid3 = Counter.start
    Counter.inc(pid1)
    Counter.inc(pid2)
    Counter.inc(pid2)
    assert 1 == Counter.value(pid1)
    assert 2 == Counter.value(pid2)
    assert 0 == Counter.value(pid3)
  end

  test "terminate counter" do
    pid = Counter.start
    Counter.inc(pid)

    Counter.terminate(pid)
    Counter.terminate(pid)

    assert ! Process.alive?(pid)
  end

  test "decrementing counter" do
    c = Counter.start
    Counter.inc(c)
    Counter.dec(c)
    Counter.inc(c)
    assert 1 == Counter.value(c)
  end
end
