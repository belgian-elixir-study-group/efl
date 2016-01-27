# GOAL: Managing state with Agents

# Elixir offers high-level constructs around processes and OTP
# to simplify common use cases.
# The Agents module allows to simply manage state without having
# to write a GenServer, read the documentation at:
# http://elixir-lang.org/docs/v1.1/elixir/Agent.html

# Let's write a simple key-balue store
# - The test case below describes the expected behaviour
# - Uncomment the tests step by step as you progress


defmodule KeyValueStore do
  def start_link do
    Agent.start_link(fn -> %{} end, name: __MODULE__)
  end

  def set(key, value) do
    Agent.update(__MODULE__, fn (map) -> Dict.put(map, key, value) end)
  end

  def get(key) do
    Agent.get(__MODULE__, fn (map) -> Dict.fetch(map, key) end)
  end

  def key?(key) do
    get(key) != :error
  end

  def keys() do
    Agent.get(__MODULE__, fn (map) -> Enum.sort(Dict.keys(map)) end)
  end

  def delete(key) do
    Agent.get_and_update(__MODULE__, fn (map) ->
      case Dict.fetch(map, key) do
        {:ok, value} ->
          {{:ok, value}, Dict.delete(map, key)}
        :error ->
          {:error, map}
      end
    end)
  end
end

ExUnit.start

defmodule KeyValueStoreTest do
  use ExUnit.Case

  setup do
    {:ok, %{pid: KeyValueStore.start_link}}
  end

  # Step 1
  test "set" do
    assert :ok == KeyValueStore.set(:foo, 1)
  end

  # Step 2
  # test "get" do
  #   KeyValueStore.set(:foo, 1)
  #   KeyValueStore.set(:bar, 2)

  #   assert {:ok, 1} == KeyValueStore.get(:foo)
  #   assert {:ok, 2} == KeyValueStore.get(:bar)
  #   assert :error == KeyValueStore.get(:baz)
  # end

  # Step 3
  # test "key?" do
  #   refute KeyValueStore.key?(:foo)

  #   KeyValueStore.set(:foo, 1)
  #   assert KeyValueStore.key?(:foo)
  # end

  # Step 4
  # test "keys" do
  #   assert [] == KeyValueStore.keys

  #   KeyValueStore.set(:foo, 1)
  #   assert [:foo] == KeyValueStore.keys

  #   KeyValueStore.set(:zzz, 2)
  #   KeyValueStore.set(:bar, 3)
  #   assert [:bar, :foo, :zzz] == KeyValueStore.keys
  # end

  # Step 5
  # test "delete" do
  #   assert :error == KeyValueStore.delete(:foo)
  #   KeyValueStore.set(:foo, 1)
  #   assert {:ok, 1} == KeyValueStore.delete(:foo)
  #   refute KeyValueStore.key?(:foo)
  # end

end
