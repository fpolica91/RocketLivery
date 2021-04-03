defmodule RocketliveryWeb.UserViewTest do
  use RocketliveryWeb.ConnCase, async: true
  import Rocketlivery.Factory
  import Phoenix.View
  alias RocketliveryWeb.UsersView


  test "renders create.json" do
    user = build(:user)
    response = render(UsersView, "create.json", user: user)
    assert %{message: "user created succesfully", user: %Rocketlivery.User{address: "112 via aurelia", age: 25, cep: "22334455", email: "chloe@chloe.com", id: "f14295b5-cf61-4a9e-8441-b78a7502508b", inserted_at: nil, name: "chloe", password: "2234433", password_hash: nil, updated_at: nil}} = response
  end
end
