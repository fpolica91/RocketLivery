defmodule Rocketlivery.Repo.Migrations.CreateOrdersTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      #  add :name, :type
      add :address, :string
      add :payment_method, :payment_method
      add :comments, :string
      add :user_id, references(:users, type: :binary_id)
      timestamps()
    end
  end
end
