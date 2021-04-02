defmodule Rocketlivery.UserTest do
  use Rocketlivery.DataCase, async: true
  import Rocketlivery.Factory
  alias Ecto.Changeset
  alias Rocketlivery.User


  describe "changeset/2" do
    test "when all parameters are valid, returns a valid changeset" do
      params = build(:user_params)
      # params = %{
      #   address:  "112 via aurelia",
      #   age: 25,
      #   cep: "22334455",
      #   cpf: "45673373737",
      #   email: "chloe@chloe.com",
      #   password: "2234433",
      #   name: "chloe"
      # }
      response = User.changeset(params)
      assert %Changeset{changes: %{name: "chloe"}, valid?: true} = response
    end

    test "when all parameters are valid, returns valid changeset with the changes" do
      params = build(:user_params)

      update_params = %{
        name: "platanihno",
        password: "2234433"
      }
      response = params
      |>User.changeset()
      |>User.changeset(update_params)

      assert %Changeset{changes: %{name: "platanihno"}, valid?: true} = response
    end

    test "when the parameters are invalid it returns an error" do
      params = %{
        address:  "112 via aurelia",
        age: 25,
        cep: "22334455",
        cpf: "45673373737",
        email: "chloe@chloe.com",

        name: "chloe"
      }
      response = User.changeset(params)
      assert errors_on(response) == %{password: ["can't be blank"]}
    end
  end
end
