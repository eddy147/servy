defmodule Servy.FourOhFourCounter do

  @name :four_oh_four_counter

  alias Servy.GenericServer

  # Client Interface

  def start do
    IO.puts "Starting the 404 counter..."
    GenericServer.start(__MODULE__, %{}, @name)
  end

  def bump_count(path) do
    GenericServer.call(@name, {:bump_count, path})
  end

  def get_count(path) do
    GenericServer.call(@name, {:get_count, path})
  end

  def get_counts do
    GenericServer.call(@name, :get_counts)
  end

  def reset do
    GenericServer.cast @name, :reset
  end

  # Server callbacks
  def handle_call({:bump_count, path}, state) do
    new_state = Map.update(state, path, 1, &(&1 + 1))
    {:ok, new_state}
  end

  def handle_call({:get_count, path}, state) do
    {Map.get(state, path, 0), state}
  end

  def handle_call(:get_counts, state) do
    {:ok, state}
  end

  def handle_cast(:reset, _state) do
    %{}
  end
end

# alias Servy.FourOhFourCounter

# pid = FourOhFourCounter.start()

# IO.inspect FourOhFourCounter.bump_count("/bla")
# IO.inspect FourOhFourCounter.bump_count("/yoo")
# IO.inspect FourOhFourCounter.bump_count("/bla")
# IO.inspect FourOhFourCounter.bump_count("/bla")
# IO.inspect FourOhFourCounter.bump_count("/yoooo")
# IO.inspect FourOhFourCounter.bump_count("/fun")
# IO.inspect FourOhFourCounter.bump_count("/yoo")

# IO.inspect FourOhFourCounter.get_count("/bla")
# IO.inspect FourOhFourCounter.get_counts
