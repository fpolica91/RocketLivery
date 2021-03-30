defmodule Rocketlivery.Users.Update do
  alias Rocketlivery.{User, Repo, Error}
  # alias Ecto.UUID
  # def call(%{"id" => id} = params) do
  #   case UUID.cast(id) do
  #     :error -> {:error, Error.incorrect_id_format()}
  #     {:ok, _uuid} -> update(params)
  #   end
  # end


  def call(%{"id" => id} = params) do
    case Repo.get(User, id) do
      nil -> {:error, Error.user_not_found()}
      user -> do_update(user, params)
    end
  end

  defp do_update(user, params) do
    user
    |>User.changeset(params)
    |>Repo.update()
  end


end
