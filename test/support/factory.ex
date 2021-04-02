defmodule Rocketlivery.Factory  do
  use ExMachina
  def user_params_factory do
      %{
        address:  "112 via aurelia",
        age: 25,
        cep: "22334455",
        cpf: "45673373737",
        email: "chloe@chloe.com",
        password: "2234433",
        name: "chloe"
      }
  end
end
