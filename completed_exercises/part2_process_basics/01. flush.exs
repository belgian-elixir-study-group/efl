#
# Write a function which flushes the mailbox of the current process and returns
# a list with the pending messages
#

defmodule Mailbox do

  def flush() do
    collect_messages([])
  end

  defp collect_messages(messages) do
    receive do
      message -> collect_messages([message|messages])
    after
      0 -> Enum.reverse(messages)
    end
  end

end


ExUnit.start

defmodule MailboxTest do
   use ExUnit.Case

  test "flush returns the messages in order" do
    send self, :a
    send self, {:b, :c}
    send self, [:d]
    assert [:a, {:b, :c}, [:d]] == Mailbox.flush()
  end

  test "flush returns an empty list when the mailbox is empty" do
    assert [] == Mailbox.flush()
  end

end
