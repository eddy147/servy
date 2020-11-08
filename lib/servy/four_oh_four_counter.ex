defmodule Servy.FourOhFourCounter do

  @name :four_oh_four_counter

  def start(initial_state \\ %{}) do
    IO.puts("Starting 404 Server...")
    pid = spawn(__MODULE__, :listen_loop, [initial_state])
    Process.register(pid, @name)
    pid
  end

  def bump_count(url) do
    send(@name, {self(), :bump_count, url})

    receive do
      {:response, count} ->
        count
    end
  end

  def get_count(url) do
    send(@name, {self(), :get_count, url})

    receive do
      {:response, count} ->
        count
    end
  end

  def get_counts() do
    send(@name, {self(), :get_counts})

    receive do
      {:response, state} ->
        state
    end
  end

  def listen_loop(state) do
    receive do
      {sender, :bump_count, url} ->
        new_state = Map.update(state, url, 1, &(&1 + 1))
        send(sender, {:response, :ok})
        listen_loop(new_state)
      {sender, :get_count, url} ->
        send(sender, {:response, Map.get(state, url, 0)})
        listen_loop(state)
      {sender, :get_counts} ->
        send(sender, {:response, state})
        listen_loop(state)
      unexpected ->
        IO.puts "Unexpected message: #{inspect unexpected}"
        listen_loop(state)
    end
  end
end
