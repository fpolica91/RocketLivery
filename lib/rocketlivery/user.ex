defmodule Rocketlivery.User  do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:address,:age,:cep,:email,:password, :name ]

  @derive {Jason.Encoder, only: [:id,:email, :name,:address,:age]}

  schema "users" do
    field :address, :string
    field :age, :integer
    field :cep, :string
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    field :name, :string

    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |>cast(params, @required_params)
    |> validate_required(@required_params)
    |>unique_constraint([:cep])
    |>unique_constraint([:email])
    |>password_hash()
  end

  defp password_hash(%Changeset {valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Bcrypt.add_hash(password))
  end

  defp password_hash(changeset), do: changeset
end
