defmodule RocketliveryWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :rocketlivery
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.LoadResource
end
