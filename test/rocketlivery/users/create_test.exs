defmodule Rocketlivery.Users.CreateTest do
  use Rocketlivery.DataCase, async: true
  alias Rocketlivery.Users.Create
  alias Rocketlivery.{User, Error}
  alias Ecto.Changeset
  import Rocketlivery.Factory

  describe "call/1" do
    test "returns a user when given valid parameters" do
      params = build(:user_params)
      response = Create.call(params)
      assert {:ok, %User{id: _id, age: 25, name: "chloe", email: "chloe@chloe.com"}} = response
    end
  end
end
