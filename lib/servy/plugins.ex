defmodule Servy.Plugins do
  def rewrite_path(%{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}"}
  end

  def rewrite_path(conv), do: conv

  @doc "Logs 404 requests"
  def track(%{status: 404, path: path} = conv) do
    IO.puts("Warning ⚠️: #{path} in on the loose!")
    conv
  end

  def track(conv), do: conv

  def log(conv), do: IO.inspect(conv, label: "conv map ✅")
end
