# There is nothing here for you to code. Run this code and understand what is going on

defmodule Echo do

  def run do

    echo_process_pid = spawn_link(Echo, :echo, [])

    send(echo_process_pid, {self(), "Hello"})

    IO.puts Process.alive?(echo_process_pid)

    receive do
      response ->
        IO.puts "response: #{response}"
    end

    send(echo_process_pid, {self(), "What's up?"})

    receive do
      response ->
        IO.puts "response: #{response}"
    end

    send(echo_process_pid, :quit)

    IO.puts Process.alive?(echo_process_pid)
    IO.puts Process.alive?(echo_process_pid)
    IO.puts Process.alive?(echo_process_pid)
  end


  def echo do
    receive do
      :quit ->
        IO.puts "Ok, quitting"

      {from, message} ->
        IO.puts ~s(received message "#{message}")
        send(from, String.reverse(message))
        echo()
    end
  end
end

Echo.run
