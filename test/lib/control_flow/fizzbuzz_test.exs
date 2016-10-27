defmodule Control.FizzBuzzTest do
  use ExUnit.Case, async: true

  test "upto/1 with -5" do
    assert_raise FunctionClauseError, fn -> Control.FizzBuzz.upto(-5) end
  end

  test "upto/1 with zero" do
    assert_raise FunctionClauseError, fn -> Control.FizzBuzz.upto(0) end
  end

  test "upto/1 with 1" do
    assert Control.FizzBuzz.upto(1) == [1]
  end

  test "upto/1 with 3" do
    assert Control.FizzBuzz.upto(3) == [1, 2, "Fizz"]
  end

  test "upto/1 with 15" do
    assert Control.FizzBuzz.upto(15) ==
      [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
  end
end
