# If you run this file, you won't get any reminders! That's because the elixir executable exits the Erlang VM after
# all the code in the file has been executed. So all the reminder processes are killed before their timer has expired.
# There are two ways to fix this. One is to sleep indefinitely at the end of the file so that the Erlang VM doesn't exit:

# :timer.sleep(:infinity)

# Another solution is to tell the elixir executable to not exit the Erlang VM which you can do using the --no-halt option, like so:
# elixir --no-halt timer.ex

defmodule Servy.Exercises.Timer do

  def remind(reminder, seconds) do
    spawn(Servy.Exercises.Timer, :do_remind, [reminder, seconds])
  end

  def do_remind(reminder, seconds) do
    :timer.sleep(seconds*1000)
    IO.puts reminder
  end

end
