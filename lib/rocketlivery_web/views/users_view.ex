defmodule RocketliveryWeb.UsersView do
  use RocketliveryWeb, :view
  alias Rocketlivery.User

  def render("create.json", %{token: token, user: %User{} = user}) do
    %{
      message: "user created succesfully",
      user: user,
      token: token
    }
  end

  def render("auth.json", %{token: token}), do: %{token: token}

  def render("show.json", %{user: %User{} = user}), do: %{user: user}
end
