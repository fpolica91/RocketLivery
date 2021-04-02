defmodule RocketliveryWeb.UserControllerTest do
  use RocketliveryWeb.ConnCase, async: true

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

        assert %{"message" => "user created succesfully", "user" => %{"address" => "112 via aurelia", "age" => 25, "email" => "chloe@chloe.com", "id" => _, "name" => "chloe"}} = response

    end
  end


end
