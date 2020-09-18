defmodule Exercises.Cards do

  @ranks [ "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A" ]
  @suits [ "♣", "♦", "♥", "♠" ]

  def deck(), do: for r <- @ranks, s <- @suits, do: {r, s}

end
