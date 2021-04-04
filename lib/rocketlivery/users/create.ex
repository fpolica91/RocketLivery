defmodule Rocketlivery.Users.Create do
  alias Rocketlivery.{Error, User, Repo}
  def call(params) do
    params
    |>User.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}
  # defp handle_insert({:error, result}) do
  #   {:error, %{status: :bad_request, result: result}}
  # end


end
