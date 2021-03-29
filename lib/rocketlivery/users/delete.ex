defmodule Rocketlivery.Users.Delete do
  alias Rocketlivery.{User, Repo}
  alias Ecto.UUID
  def call(id) do
    case UUID.cast(id) do
      :error ->  {:error, %{status: :not_found, result: "Id of incorrect format"}}
      {:ok, uuid} -> delete(uuid)
    end
  end


  def delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> Repo.delete(user)
    end
  end


end
