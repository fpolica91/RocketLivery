defmodule Rocketlivery.Factory  do
  use ExMachina.Ecto, repo: Rocketlivery.Repo
  alias Rocketlivery.User
  def user_params_factory do
      %{
        address:  "112 via aurelia",
        age: 25,
        cep: "22334455",
        email: "chloe@chloe.com",
        password: "2234433",
        name: "chloe"
      }
  end

  def user_factory do
    %User{
      address:  "112 via aurelia",
      age: 25,
      cep: "22334455",
      email: "chloe@chloe.com",
      password: "2234433",
      name: "chloe",
      id: "f14295b5-cf61-4a9e-8441-b78a7502508b"
    }
  end
end
