defmodule Servy.HttpClient do
  def send_request(request) do
    case :gen_tcp.connect('localhost', 4000, [:binary, packet: :raw, active: false]) do
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

request = """
GET /bears HTTP/1.1\r
Host: example.com\r
User-Agent: ExampleBrowser/1.0\r
Accept: */*\r
\r
"""

IO.puts(Servy.HttpClient.send_request(request))
