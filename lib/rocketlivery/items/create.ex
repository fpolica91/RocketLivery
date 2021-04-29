defmodule Rocketlivery.Items.Create do
  alias Rocketlivery.{Error, Item, Repo}
  def call(params) do
    IO.inspect(params, label: "PARAMS")
    params
    |>Item.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %Item{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}



end
#  params = %{
# 	"category": "food",
# 	"description": "lasagna",
# 	"price": "29.99",
# 	"photo": "/photos/vegan-pizza.jpg"
# }
