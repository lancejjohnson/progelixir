defmodule Processes.ExerciseTwo do

  def call(name) do
    receive do
      {sender, sender_name} ->
        IO.puts "Received #{sender_name} from #{sender}."
        send sender, {self, name}
      _ ->
        nil
    end
  end

end

fred = spawn Processes.ExerciseTwo, :call, ["Fred"]
# barney = spawn ET, :call, ["Barney"]

send fred, "Test"
receive do
  {_sender, name} ->
    IO.puts "ok, #{name}"
end
