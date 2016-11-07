defmodule SpawnRecursive do
  def greet do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello, #{msg}"}
        greet
    end
  end
end

defmodule Receiver do
  def call do
    receive do
      {:ok, message} ->
        IO.puts message
      Process.sleep(1_000)
      call
    after 500 ->
      IO.puts "Nothing more to recieve. Shutting down."
    end
  end
end

greeter = spawn &SpawnRecursive.greet/0
receiver = spawn &Receiver.call/0

family = ~w(Lance Kimberly Kiersten Mikaelah Elaias Evan)
for member <- family do
  send greeter, {receiver, member}
end
