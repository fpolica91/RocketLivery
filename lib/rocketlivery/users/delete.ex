defmodule Rocketlivery.Users.Delete do
  alias Rocketlivery.{User, Repo, Error}
  alias Ecto.UUID
  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.incorrect_id_format()}
      # :error ->  {:error, %{status: :not_found, result: "Id of incorrect format"}}
      {:ok, uuid} -> delete(uuid)
    end
  end


  def delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found()}
      user -> Repo.delete(user)
    end
  end
end
