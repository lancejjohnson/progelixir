defmodule Parallel do
  @doc """
  The spawning process is whatever process calls Parallel.pmap/2.
  Record that process as `me`.

  For each element in the collection,
  *  spawn a new process
  *  that process runs an anonymous function that sends the calling process
     it's own pid and the result of running the function passed to the original
     `pmap` call.
  *  NOTA BENE: the call to self() inside the anonymous function is the
     *spawned* process, NOT the spawning process.

  For each pid in from the original map
  *   receive messages from the process that match the pattern of that process's
      id and the result it sent back.
  *   note: pattern matching on the value of the spawned process pid to put the
      results in the correct order.
  """
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn e -> spawn_link(fn -> (send me, {self(), fun.(e)}) end) end)
    |> Enum.map(fn pid -> receive do {^pid, result} -> result end end)
  end
 end
