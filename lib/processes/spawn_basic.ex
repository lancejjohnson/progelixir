defmodule SpawnBasic do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
    end
  end
  def greet(name) do
    IO.puts "Hello, #{name}"
  end

  def say_hello do
    IO.puts "Waiting to receive messages:\n"
    receive do
      {sender, name} ->
        print_formatted_name(name)
        send sender, :ok
    end
  end

  def print_formatted_name(name) do
    IO.puts "Hello there, #{name}"
  end
end
