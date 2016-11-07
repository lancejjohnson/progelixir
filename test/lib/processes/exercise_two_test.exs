defmodule Processes.ExerciseTwoTest do
  use ExUnit.Case
  alias Processes.ExerciseTwo, as: ET

  setup do
    Process.register(self, :test)
    :ok
  end

  test "it works" do
    fred = spawn ET, :call, ["Fred"]
    barney = spawn ET, :call, ["Barney"]

    send fred, "Test"
    assert_received {^fred, "Fred"}

    # send barney, "Test"
    # assert_received {^barney, "Barney"}
  end
end
