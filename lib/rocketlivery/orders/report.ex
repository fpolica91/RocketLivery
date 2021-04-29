defmodule Rocketlivery.Orders.Report do
  alias Rocketlivery.{Repo, Order, Item}
  alias Rocketlivery.Orders.TotalPrice
  import Ecto.Query

  @default_block_size 500
  def create(filename \\ "report.csv") do
    query = from order in Order, order_by: order.user_id
    # query and Repo.stream need to be inside of a transaction
    {:ok, orders_list } = Repo.transaction(
      fn ->
        # returns 500 by 500
        query
        |>Repo.stream(max_rows: @default_block_size)
        |>Stream.chunk_every(@default_block_size)
        |>Stream.flat_map(fn chunk -> Repo.preload(chunk, :items) end)
        |>Enum.map(&parse_line/1)
    end, timeout: :infinity)
    File.write!(filename, orders_list)
  end

  defp parse_line(%Order{user_id: user_id, payment_method: payment_method, items: items}) do
    # mapping over list of items and converting to string
    item_string = Enum.map(items, &item_to_string/1)
    total_price = TotalPrice.calculate(items)
    "#{user_id}, #{item_string}, #{payment_method}, #{total_price}\n"
  end

  defp item_to_string(%Item{category: category, description: description, price: price }) do
    "#{category}, #{description}, #{price}"
  end
end
