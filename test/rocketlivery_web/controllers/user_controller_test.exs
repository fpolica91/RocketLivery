defmodule RocketliveryWeb.UserControllerTest do
  use RocketliveryWeb.ConnCase, async: true
  import Rocketlivery.Factory

  describe "create/2" do
    test "when all parameteres are valid creates a user", %{conn: conn} do
    params = %{
        "address" =>  "112 via aurelia",
        "age" => 25,
        "cep" => "22334455",
        "cpf" => "45673373737",
        "email" => "chloe@chloe.com",
        "password" =>  "2234433",
        "name" => "chloe"
      }

      response =
        conn
        |>post(Routes.users_path(conn, :create, params))
        |>json_response(:created)

        assert %{"message" => "user created succesfully",
         "user" => %{"address" => "112 via aurelia", "age" => 25,
         "email" => "chloe@chloe.com", "id" => _, "name" => "chloe"}} = response
    end
  end

  describe "delete/2" do
    test "deletes a user if a valid id is passed", %{conn: conn} do
      id = "f14295b5-cf61-4a9e-8441-b78a7502508b"
      insert(:user)

      response =
        conn
        |>delete(Routes.users_path(conn, :delete, id))
        |>response(:no_content)

        assert response == ""
    end
  end
end
