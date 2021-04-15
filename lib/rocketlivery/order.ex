defmodule Rocketlivery.Order  do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Enum
  alias Rocketlivery.{Item, User}

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:address,:comments, :payment_method, :user_id]
  @payment_method [:cash, :debit_card, :credit_card]
  @derive {Jason.Encoder, only: @required_params ++ [:id, :items]}

  schema "orders" do
    field :address, :string
    field :comments, :string
    field :payment_method, Enum, values: @payment_method

    many_to_many :items, Item, join_through: "orders_items"
    belongs_to :user, User
    timestamps()
  end



  def changeset(struct \\ %__MODULE__{}, params, items) do
    struct
    |>cast(params, @required_params)
    |> validate_required(@required_params)
    |>put_assoc(:items, items)
    |>validate_length(:address, min: 6)
  end


end
