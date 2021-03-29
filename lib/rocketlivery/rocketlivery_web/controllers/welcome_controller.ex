defmodule RocketliveryWeb.WelcomeController do
  use RocketliveryWeb, :controller
  def index(connection, _params) do
    connection
    |>put_status(:ok)
    |>json("Hello User")
  end
end
