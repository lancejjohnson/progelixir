defmodule Exercises.FizzBuzz do
  def upto(n), do: upto(n, &(&1))
  def upto(n, func) when n > 0, do: Enum.map(1..n, fn x -> func.(x) end)

  defmodule Case do
    def upto(n), do: Exercises.FizzBuzz.upto(n, &__MODULE__.call/1)

    def call(n) do
      case {n, rem(n, 3) == 0, rem(n, 5) == 0} do
        {_, true, true} -> "FizzBuzz"
        {_, true, false} -> "Fizz"
        {_, false, true} -> "Buzz"
        {n, false, false} -> n
      end
    end
  end

  defmodule Cond do
    def upto(n), do: Exercises.FizzBuzz.upto(n, &__MODULE__.call/1)

    def call(n) do
      cond do
        rem(n, 3) == 0 and rem(n, 5) == 0 ->
          "FizzBuzz"
        rem(n, 3) == 0 ->
          "Fizz"
        rem(n, 5) == 0 ->
          "Buzz"
        true ->
          n
      end
    end
  end

  defmodule PatternMatching do
    def upto(n), do: Exercises.FizzBuzz.upto(n, &__MODULE__.call/1)

    def call(n), do: _call(n, rem(n, 3) == 0, rem(n, 5) == 0)

    defp _call(_, true,  false), do: "Fizz"
    defp _call(_, false, true),  do: "Buzz"
    defp _call(_, true,  true),  do: "FizzBuzz"
    defp _call(n, false, false), do: n
  end
end
