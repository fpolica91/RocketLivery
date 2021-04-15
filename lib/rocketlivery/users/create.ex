defmodule Rocketlivery.Users.Create do
  alias Rocketlivery.ViaCep.Client
  alias Rocketlivery.{Error, User, Repo}
  # 29560000
  def call(%{"cep" => cep} = params) do
    case Client.get_cep_info(cep) do
     {:ok, _cep}  -> create_user(params)
     {:error, _reason} = error -> error
    end
  end

  defp create_user(params) do
    params
    |>User.changeset()
    |>Repo.insert()
    |>handle_insert()
  end

  defp handle_insert({:ok, %User{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}



end
