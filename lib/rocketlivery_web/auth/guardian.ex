defmodule RocketliveryWeb.Auth.Guardian do
  use Guardian, otp_app: :rocketlivery
  alias Rocketlivery.{User, Error}
  alias Rocketlivery.Users.Get, as: UserGet

  def subject_for_token(%User{id: id}, _claims), do: {:ok, id}

  def subject_for_token(_, _) do
    {:error, :reason_for_error}
  end

  def resource_from_claims(claims) do
    claims
    |>Map.get("sub")
    |>UserGet.by_id()
  end
  def resource_from_claims(_claims) do
    {:error, :reason_for_error}
  end

  def authenticate(%{"id" => user_id, "password" => password}) do
      with {:ok, %User{password_hash: hash} = user} <- UserGet.by_id(user_id),
           true <- Pbkdf2.verify_pass(password, hash),
           {:ok, token, _claims} <- encode_and_sign(user)
         do
          {:ok, token}
         else
          false -> {:error, Error.build(:unauthorized, "Please verify your credentials")}
          error -> error
      end
  end

  def authenticate(_) do
    {:error, Error.build(:bad_request, "Please verify your credentials and try again")}
  end
end
