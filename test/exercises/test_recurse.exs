defmodule Test.Servy.Exercises.Recurse do
  use ExUnit.Case
  alias Servy.Exercises.Recurse

  test "sum" do
    assert Recurse.sum([1, 2, 3, 4, 5], 0) == 15
  end

  test "triple" do
    assert Recurse.triple([1, 2, 3, 4]) == [3, 6, 9, 12]
  end

  test "tail optimized triple" do
    assert Recurse.triple([1, 2, 3, 4], []) == [3, 6, 9, 12]
  end

  test "duplicate" do
    assert Recurse.duplicate("AQ", -1) == ""
    assert Recurse.duplicate("AQ", 0) == ""
    assert Recurse.duplicate("AQ", 1) == "AQ"
    assert Recurse.duplicate("AQ", 4) == "AQAQAQAQ"
  end

  test "my map" do
    assert Recurse.my_map([1,2,3,4,5], &(&1 * 3)) == [3,6,9,12,15]
  end
end
