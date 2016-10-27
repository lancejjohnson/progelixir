defmodule Control do
  defmodule FizzBuzz do
    def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

    defp fizzbuzz(n) do
      cond do
        rem(n, 3) == 0 && rem(n, 5) == 0 ->
          "FizzBuzz"
        rem(n, 3) == 0 ->
          "Fizz"
        rem(n, 5) == 0 ->
          "Buzz"
        true ->
          n
      end
    end

    @moduledoc """
    Refactor out the `cond` to use pattern matching with multi-head functions.
    """
    defmodule Pattern do
      def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

      defp fizzbuzz(n), do: _fizzword(n, div_by(n, 3), div_by(n, 5))

      defp _fizzword(_, true,  true),  do: "FizzBuzz"
      defp _fizzword(_, true,  false), do: "Fizz"
      defp _fizzword(_, false, true),  do: "Buzz"
      defp _fizzword(n, false, false), do: n

      defp div_by(num, den) when rem(num, den) == 0, do: true
      defp div_by(num, den) when rem(num, den) != 0, do: false
    end
  end

  defmodule Case do
    def verify_agent(agent) do
      case agent do
        %{name: "Bond"} = agent ->
          {:ok, agent}
        _ ->
          {:error, "Not verified"}
      end
    end

    def fancy_verify_agent(agent) do
      case agent do
        # %{number: number} = verified when number >= 7 ->
        verified = %{number: number} when number >= 7 ->
          {:ok, verified}
        %{name: "Powers"} = verified ->
          {:ok, verified}
        _ ->
          {:error, "Not verified"}
      end
    end
  end
end
