defmodule Test.Servy do
  use ExUnit.Case
  doctest Servy

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "deck" do
    assert Exercises.Cards.deck() == [
      {"2", "♣"},
      {"2", "♦"},
      {"2", "♥"},
      {"2", "♠"},
      {"3", "♣"},
      {"3", "♦"},
      {"3", "♥"},
      {"3", "♠"},
      {"4", "♣"},
      {"4", "♦"},
      {"4", "♥"},
      {"4", "♠"},
      {"5", "♣"},
      {"5", "♦"},
      {"5", "♥"},
      {"5", "♠"},
      {"6", "♣"},
      {"6", "♦"},
      {"6", "♥"},
      {"6", "♠"},
      {"7", "♣"},
      {"7", "♦"},
      {"7", "♥"},
      {"7", "♠"},
      {"8", "♣"},
      {"8", "♦"},
      {"8", "♥"},
      {"8", "♠"},
      {"9", "♣"},
      {"9", "♦"},
      {"9", "♥"},
      {"9", "♠"},
      {"10", "♣"},
      {"10", "♦"},
      {"10", "♥"},
      {"10", "♠"},
      {"J", "♣"},
      {"J", "♦"},
      {"J", "♥"},
      {"J", "♠"},
      {"Q", "♣"},
      {"Q", "♦"},
      {"Q", "♥"},
      {"Q", "♠"},
      {"K", "♣"},
      {"K", "♦"},
      {"K", "♥"},
      {"K", "♠"},
      {"A", "♣"},
      {"A", "♦"},
      {"A", "♥"},
      {"A", "♠"}
    ]
  end

  test "cat lovers" do
    assert ["Becky"] == Exercises.Comprehensions.getCatLovers()
  end

  test "dog lovers" do
    assert ["Betty", "Bob"] == Exercises.Comprehensions.getDogLovers()
  end

  test "calculate area" do
    assert 200 = Exercises.Comprehensions.getArea()
  end
end
