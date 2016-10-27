defmodule ControlFlowTest do
  use ExUnit.Case, async: true
  doctest ControlFlow

  test "return value is the expression valuated" do
    assert ControlFlow.my_name_with_if?("Barney") == nil
    assert ControlFlow.my_name_with_if?("Lance") == "Yup, that's my name"
  end
end
