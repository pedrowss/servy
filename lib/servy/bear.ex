defmodule Servy.Bear do
  @derive {Jason.Encoder, only: [:id, :name, :type, :hibernating]}
  defstruct id: nil, name: "", type: "", hibernating: false

  def is_grizzly(bear) do
    bear.type == "Grizzly"
  end

  def order_asc_by_name(b1, b2) do
    b1.name <= b2.name
  end
end
