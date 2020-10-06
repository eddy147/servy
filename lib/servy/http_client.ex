defmodule Servy.HttpClient do
  def send_request(request, port) do
    case :gen_tcp.connect('localhost', port, [:binary, packet: :raw, active: false]) do
      {:error, reason} ->
        IO.puts "Error connecting: #{reason}"
      {:ok, socket} ->
        :ok = :gen_tcp.send(socket, request)
        {:ok, response} = :gen_tcp.recv(socket, 0)
        :ok = :gen_tcp.close(socket)
        response
    end
  end
end
