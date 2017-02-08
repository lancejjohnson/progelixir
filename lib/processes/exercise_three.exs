defmodule Foo do
  import :timer, only: [sleep: 1]

  def init(parent, name) do
    send parent, "I am #{name}! Thank for you making me!"
    handle()
  end

  def handle do
    receive do
      msg ->
        IO.puts "You've got mail! #{inspect msg}"
    after 10_000 ->
      "Ok, nothing to do. See ya!"
    end

    handle
  end

  def run do
    s1 = spawn(Foo, :init, [self(), "first"])
    s2 = spawn(Foo, :init, [self(), "second"])
    sleep 2_000
  end
end

Foo.run

defmodule WaitingFoo do

end
