defmodule Rocketlivery.Users.Get do
  alias Rocketlivery.{User, Repo, Error}
  # alias Ecto.UUID

  # def by_id(uuid) do
  #   case UUID.cast(uuid) do
  #     :error -> {:error, Error.incorrect_id_format()}
  #     # :error -> {:error, %{status: :not_found, result: "Invalid id format"}}
  #     {:ok, uuid} -> get(uuid)
  #   end
  # end

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found()}
      # nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> {:ok, user}
    end
  end
end
