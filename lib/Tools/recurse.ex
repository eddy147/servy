defmodule Tools.Recurse do

  def sum([head | tail], amount) do
    amount = amount + head
    sum(tail, amount)
  end

  def sum([], amount) do
    amount
  end

  def triple([head | tail]) do
    [head*3 | triple(tail)]
  end

  def triple([]), do: []

  def triple([head | tail], current_list) do
    current_list = [head*3 | current_list]
    triple(tail, current_list)
  end

  def triple([], current_list) do
    current_list |> Enum.reverse()
  end

  def duplicate(s, times) do
    duplicate(s, s, times)
  end

  defp duplicate(_, _, times) when times < 1,  do: ""
  defp duplicate(_, s, times) when times == 1, do: s
  defp duplicate(orig, s, times) when times > 1, do: duplicate(orig, s <> orig, times - 1)

  def my_map([head|tail], f) do
    [f.(head) | my_map(tail, f)]
  end

  def my_map([], _f), do: []

end

IO.puts Tools.Recurse.sum([1,2,3,4,5], 0)

IO.inspect Tools.Recurse.triple([1,2,3,4])

IO.puts "Tail optimized:"
IO.inspect Tools.Recurse.triple([1,2,3,4], [])

IO.puts Tools.Recurse.duplicate("AQ", -1)
IO.puts Tools.Recurse.duplicate("AQ", 0)
IO.puts Tools.Recurse.duplicate("AQ", 1)
IO.puts Tools.Recurse.duplicate("AQ", 4)

IO.inspect Tools.Recurse.my_map([1,2,3,4,5], &(&1 * 3))
