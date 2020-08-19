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

end

IO.puts Tools.Recurse.sum([1,2,3,4,5], 0)

IO.inspect Tools.Recurse.triple([1,2,3,4])

IO.puts "Tail optimized:"
IO.inspect Tools.Recurse.triple([1,2,3,4], [])
