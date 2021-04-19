defmodule Rocketlivery.Users.Create do
  alias Rocketlivery.ViaCep.Client
  alias Rocketlivery.{Error, User, Repo}
  # 29560000
  def call(%{"cep" => cep} = params) do
     changeset = User.changeset(params)
    with {:ok, %User{}}  <- User.build(changeset),
         {:ok, _cep} <- Client.get_cep_info(cep),
         {:ok, %User{}} = user <- Repo.insert(changeset)
       do
          user
       else
        {:error, %Error{}} = error -> error
        {:error, result} -> {:error, Error.build(:bad_request, result)}
    end
  end

  # defp create_user(params) do
  #   params
  #   |>Repo.insert()
  #   |>handle_insert()
  # end

  # defp handle_insert({:ok, %User{}} = result), do: result
  # defp handle_insert({:error, result}), do: {:error, Error.build(:bad_request, result)}



end
