defmodule Rocketlivery.Users.Create do
  alias Rocketlivery.{User, Repo}
  def call(params) do
    params
    |>User.changeset()
    |>Repo.insert()
  end
end
# %{
#   address: "112 via aurelia",
#   age: 23,
#   cep: "333333",
#   email: "chloe@chloe22.com",
#   name: "chloe",
#   password: "chloe124"
# }
