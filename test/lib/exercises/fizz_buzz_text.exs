defmodule Exercises.FizzBuzzTest do
  use ExUnit.Case
  alias Exercises.FizzBuzz.{Cond, Case, PatternMatching}

  test "each impl passes" do
    for impl <- [Cond, Case, PatternMatching] do
      assert_passes_fizz_buzz(&impl.upto/1)
    end
  end

  defp assert_passes_fizz_buzz(func) do
    assert_raise FunctionClauseError, fn -> func.(-5) end
    assert_raise FunctionClauseError, fn -> func.(0) end
    assert expected(:three) == func.(3)
    assert expected(:five) == func.(5)
    assert expected(:fifteen) == func.(15)
  end

  defp expected(arg) do
    %{
      one: [1],
      three: [1, 2, "Fizz"],
      five: [1, 2, "Fizz", 4, "Buzz"],
      fifteen: [1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
    } |> Map.fetch!(arg)
  end
end
