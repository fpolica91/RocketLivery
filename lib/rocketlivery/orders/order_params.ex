defmodule Rocketlivery.OrderParams  do
  use Ecto.Schema
  import Ecto.Changeset
  @required_params [:quantity]
  @derive Jason.Encoder



  schema "order_params" do
    field :quantity, :integer
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |>cast(params, @required_params)
    |> validate_required(@required_params)
    |>validate_number(:quantity, greater_than: 0)
    |>case do
      %{valid?: false, changes: changes} = changeset when changes == %{} ->
        # If the changeset is invalid and has no changes, it is
        # because all required fields are missing, so we ignore it.
        %{changeset | action: :ignore}
      changeset ->
        changeset
    end
  end



  # ab3f7dc9-e77c-4e09-959c-0e93335f9d35
end
