defmodule Exercises.ControlFlow3Test do
  use ExUnit.Case, async: true
  import Exercises.ControlFlow3

  test "ok! returns data from the tuple" do
    assert "Hello, World!" == ok!({:ok, "Hello, World!"})
  end

  test "ok! raises an exception" do
    assert_raise RuntimeError, fn -> ok!("bar") end
  end
end
