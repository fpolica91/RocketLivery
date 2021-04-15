defmodule Rocketlivery.Orders.ValidateAndDuplicate do
  alias Rocketlivery.Error

  def call(items, item_ids, item_params) do
    items_map = Map.new(items, fn item -> {item.id, item} end)
    item_ids
    |>Stream.map(fn id -> {id,  Map.get(items_map, id) }end)
    |>Enum.any?(fn {_id, value} -> is_nil(value) end)
    |>multiply_items(items_map, item_params)
  end

  defp multiply_items(true, _items, _items_params), do: {:error, Error.item_not_found()}

  defp multiply_items(false, items, items_params) do

    items =
      # accumulator here is []
      Enum.reduce(items_params, [], fn %{"id" => id, "quantity" => quantity}, acc ->
        item = Map.get(items, id)
        acc++ List.duplicate(item, quantity)
      end)
      {:ok, items}
  end


end
