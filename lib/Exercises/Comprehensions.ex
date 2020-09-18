defmodule Exercises.Comprehensions do
  @prefs  [{"Betty", :dog}, {"Bob, :dog"}, {"Becky", :cat}]

  def getCatLovers(), do: for ({name, :cat} <- @prefs), do: name
end
