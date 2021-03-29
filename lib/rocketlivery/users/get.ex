defmodule Rocketlivery.Users.Get do
  alias Rocketlivery.{User, Repo}
  alias Ecto.UUID

  def by_id(uuid) do
    case UUID.cast(uuid) do
      :error -> {:error, %{status: :not_found, result: "Invalid id format"}}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> {:ok, user}
    end
  end



end
