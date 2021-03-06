defmodule Rocketlivery.ViaCep.Client do
  use Tesla
  alias Tesla.Env
  alias Rocketlivery.Error
  alias Rocketlivery.ViaCep.Behavior
  @baseurl "https://viacep.com.br/ws/"
  plug Tesla.Middleware.JSON

  @behaviour Behavior
  def get_cep_info(url \\ @baseurl, cep) do
    "#{url}#{cep}/json/"
    |>get()
    |>handle_get()
  end

  defp handle_get({:ok, %Env{status: 200, body: %{"erro" => true}}}) do
    {:error, Error.build(:not_found, "CEP cannot be found")}
  end

  defp handle_get({:ok, %Env{status: 400, body: _body}}) do
    {:error, Error.build(:bad_request, "Invalid CEP")}
  end

  defp handle_get({:ok, %Env{status: 200, body: body}}) do
    {:ok, body}
  end
  defp handle_get({:error, reason}) do
    {:error, Error.build(:bad_request, reason)}
  end
end
