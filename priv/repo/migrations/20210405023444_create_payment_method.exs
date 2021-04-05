defmodule Rocketlivery.Repo.Migrations.CreatePaymentMethod do
  use Ecto.Migration

  def change do
    up_query = "CREATE TYPE payment_method AS ENUM ('cash', 'debit_card', 'credit_card')"
    down_query = "DROP TYPE payment_method"
    execute(up_query, down_query)
  end
end
