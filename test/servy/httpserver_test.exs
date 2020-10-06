defmodule Servy.HttpServer.Test do
  use ExUnit.Case

  import Servy.HttpServer
  import Servy.HttpClient

  alias Servy.HttpServer
  alias Servy.HttpClient

  test "send GET request" do
    request = """
    GET /wildthings HTTP/1.1\r
    Host: example.com\r
    User-Agent: ExampleBrowser/1.0\r
    Accept: */*\r
    \r
    """

    port = 9999
    spawn(HttpServer, :start, [port])
    response = HttpClient.send_request(request, port)

    assert response == """
    HTTP/1.1 200 OK\r
    Content-Type: text/html\r
    Content-Length: 20\r
    \r
    Bears, Lions, Tigers
    """

  end


end
