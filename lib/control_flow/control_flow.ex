defmodule ControlFlow do
  @doc ~S"""
  The implementation of `if` contains an implicit `else:` clause that returns
  `nil` if no explicity `else:` clause is provided. Rather than returning the
  value of the conditional, then, `if` returns `nil` if the condition is falsey
  and no `else` is provided.

  ## Examples

      iex> ControlFlow.my_name_with_if?("Barney")
      nil
  """
  def my_name_with_if?(name) do
    if name == "Lance" do
      "Yup, that's my name"
    end
  end
end

