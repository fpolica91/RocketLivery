defmodule Rocketlivery.ValidatedCep do
  use Ecto.Schema
  import Ecto.Changeset


  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:cep, :localidade]

  schema "valid_cpe" do
    field :cep, :string
    field :localidade, :string
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |>cast(params, @required_params)
    |>validate_required(@required_params)

  end


end

# %{
#   cep: "29560-000",
#   localidade: "Guaçuí",
# }
