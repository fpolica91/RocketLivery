defmodule RocketliveryWeb.OrdersView do
  use RocketliveryWeb, :view
  alias Rocketlivery.Order

  def render("create.json", %{order: %Order{} = order}) do
    %{
      message: "Order Successfully Created",
      order: order
    }
  end

end
