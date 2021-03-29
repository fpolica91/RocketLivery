defmodule Rocketlivery.Users.Email do
  alias Rocketlivery.{User, Repo}

  def get(email) do
    case Repo.get_by(User, email) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> {:ok, user}
    end
  end

end
