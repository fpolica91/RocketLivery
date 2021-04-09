defmodule Rocketlivery.Orders.Create do
  alias Rocketlivery.Orders.ValidateAndDuplicate
  alias Rocketlivery.{Error, Order, Item, Repo}
  import Ecto.Query

  def call(%{"items" => item_params} = params) do
    item_ids = Enum.map(item_params, fn item -> item["id"] end)
    query = from item in Item, where: item.id in ^item_ids
    query
    |>Repo.all()
    |>ValidateAndDuplicate.call(item_ids, item_params)
    |> handle_items(params)
  end

  defp handle_items({:ok, items}, params) do
    params
    |> Order.changeset(items)
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_items({:error, result}, _params), do: {:error, Error.build(:baq_request, result)}

  defp handle_insert({:ok, %Order{}} = order), do: order
  defp handle_insert({:error, result}), do: {:error, Error.build(:baq_request, result)}
end


  # defp fetch_items(%{"items" => item_params}) do
  #   item_ids = Enum.map(item_params, fn item -> item["id"] end)
  #   query = from item in Item, where: item.id in ^item_ids

  #   query
  #   |> Repo.all()
  #   |> ValidateAndDuplicate.call(item_ids, item_params)
  # end

# defp validate_params(items, item_ids, item_params) do
#   items_map = Map.new(items, fn item -> {item.id, item} end)

#   item_ids
#   # the key is the id, and the value is whatever we find in the map,
#   # either nil or an item
#   |>Stream.map(fn id -> {id,  Map.get(items_map, id) }end)
#   |>Enum.any?(fn {_id, value} -> is_nil(value) end)
#   |>multiply_items(items_map, item_params)
# end

# defp multiply_items(true, _items, _items_params), do: {:error, "Invalid ids"}

# defp multiply_items(false, items, items_params) do
#   items =
#     # accumulator here is []
#     Enum.reduce(items_params, [], fn %{"id" => id, "quantiy" => quantiy}, acc ->
#       item = Map.get(items, id)
#       acc++ List.duplicate(item, quantiy)
#     end)
#     {:ok, items}
# end

# map with on false id.
#  %{
#    "items" => [
#         %{"id" => "2ed605f7-36b6-40c3-9033-b508c9097ef3", "quantiy" => 3},
#         %{"id" => "2ed605f7-36b6-40c3-9033-b508c9097ef3", "quantiy" => 3},
#       ],
#       "user_id" => "fb45deb5-6f6e-4754-bd67-30f4906e6e85",
#       "comments" => "Extra sauce and ketchup",
#       "address" => "112 via Emilia",
#       "payment_method" => "debit_card"
# }
