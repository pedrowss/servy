defmodule Servy.HttpClient do
  @moduledoc false

  def send_request(request) do
    # to make it runnable on one machine
    some_host_in_net = 'localhost'

    {:ok, socket} =
      :gen_tcp.connect(some_host_in_net, 4000, [:binary, packet: :raw, active: false])

    :ok = :gen_tcp.send(socket, request)
    {:ok, response} = :gen_tcp.recv(socket, 0)
    :ok = :gen_tcp.close(socket)
    response
  end
end
