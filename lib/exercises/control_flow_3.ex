defmodule Exercises.ControlFlow3 do
  def ok!({:ok, data}), do: data
  def ok!({:error, message}), do: raise "I can't handle #{message}"
  def ok!(arg), do: raise "I can't handle #{arg}"
end
