defmodule RocketliveryWeb.UsersView do
  use RocketliveryWeb, :view
  alias Rocketlivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "user created succesfully",
      user: user
      # user: %{
      #   id: user.id,
      #   name: user.name,
      #   address: user.address,
      #   email: user.email
      # }
    }
  end
end
