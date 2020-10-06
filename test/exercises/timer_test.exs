defmodule Servy.Exercises.TimerTest do
  use ExUnit.Case
  doctest Servy.Exercises.Timer

  alias Servy.Exercises.Timer

  test "test the timer" do
    Timer.remind("Stand up", 5)
  end
end
