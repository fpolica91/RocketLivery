defmodule Rocketlivery.Item  do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Enum
  alias Rocketlivery.Order

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:category,:description,:price,:photo]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "items" do
    field :category, Enum, values: [:food, :drink, :dessert]
    field :description, :string
    field :price, :decimal
    field :photo, :string
    many_to_many :order, Order, join_through: "orders_items"
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |>cast(params, @required_params)
    |> validate_required(@required_params)
    |>validate_length(:description, min: 6)
    |>validate_number(:price, greater_than: 0)
  end

  # ab3f7dc9-e77c-4e09-959c-0e93335f9d35
end
