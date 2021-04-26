defmodule RocketliveryWeb.UsersController do
  use RocketliveryWeb, :controller
  alias Rocketlivery.User
  alias RocketliveryWeb.{FallbackController, Auth.Guardian}

  action_fallback FallbackController
  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketlivery.create_user(params),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user)
     do
      conn
      |>put_status(:created)
      |>render("create.json", token: token, user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Rocketlivery.get_by_id(id) do
      conn
      |>put_status(:ok)
      |>render("show.json", user: user)
    end
  end

  def sign_in(conn, params) do
    with {:ok, token} <- Guardian.authenticate(params) do
      conn
      |>put_status(:ok)
      |>render("auth.json", token: token)
    end
  end



  def update(conn, params) do
    with {:ok, %User{} = user} <- Rocketlivery.update_user(params) do
      conn
      |>put_status(:ok)
      |>render("show.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{}} <- Rocketlivery.delete_user(id) do
      conn
      |>put_status(:no_content)
      |>text("")
    end
  end

end
