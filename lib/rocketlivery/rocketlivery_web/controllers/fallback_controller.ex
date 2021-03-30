defmodule RocketliveryWeb.FallbackController do
  use RocketliveryWeb, :controller
  alias RocketliveryWeb.ErrorView
  alias Rocketlivery.Error
  def call(conn, {:error, %Error{status: status, result: result}}) do
    conn
    |>put_status(status)
    |>put_view(ErrorView)
    |>render("error.json", result: result)
  end

  # def call(connection, {:error, result}) do
  #   connection
  #   |>put_status(:bad_request)
  #   |>put_view(ErrorView)
  #   |>render("400.json", result: result)
  # end
end
