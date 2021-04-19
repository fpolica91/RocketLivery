defmodule Rocketlivery.Repo.Migrations.CreateCepValidation do
  use Ecto.Migration

  def change do
    create table :valid_cpe do
      add :cep, :string
      add :localidade, :string
      timestamps()
    end
  end
end
