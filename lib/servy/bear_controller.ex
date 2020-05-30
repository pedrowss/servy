defmodule Servy.BearController do
  alias Servy.Wildthings
  alias Servy.Bear
  alias Servy.BearView

  import Servy.View, only: [render: 3]

  def index(conv) do
    bears =
      Wildthings.list_bears()
      # |> Enum.filter(&Bear.is_grizzly/1)
      |> Enum.sort(&Bear.order_asc_by_name/2)

    render(conv, "index.eex", bears: bears)
    # %{conv | status: 200, resp_body: BearView.index(bears)}
  end

  def show(conv, %{"id" => id}) do
    bear = Wildthings.get_bear(id)

    # render(conv, "show.eex", bear: bear)
    %{conv | status: 200, resp_body: BearView.show(bear)}
  end

  def create(conv, %{"name" => name, "type" => type}) do
    %{conv | status: 201, resp_body: "Created a #{type} bear named #{name}!"}
  end

  def delete(conv, _params) do
    %{conv | status: 403, resp_body: "Bears must never be deleted!"}
  end
end
