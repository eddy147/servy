defmodule Servy.Exercises.Comprehensions do
  @prefs  [{"Betty", :dog}, {"Bob", :dog}, {"Becky", :cat}]

  @style %{"width" => 10, "height" => 20, "border" => "2px"}

  def getCatLovers(), do: for ({name, :cat} <- @prefs), do: name
  def getDogLovers(), do: for ({name, :dog} <- @prefs), do: name

  def getArea() do
    # instead of this
    # @style["width"] * @style["height"]
    # we can use atoms like so:
    # mapped_style = Map.new(@style, fn{key, val} -> {String.to_atom(key), val} end)
    # or like so, using comprehensions:
    mapped_style = for {key, val} <- @style, into: %{}, do: {String.to_atom(key), val}
    mapped_style[:width] * mapped_style[:height]
  end
end
