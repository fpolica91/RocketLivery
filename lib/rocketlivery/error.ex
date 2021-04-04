defmodule Rocketlivery.Error do
  @keys [:status, :result]
  @enforce_keys @keys
  defstruct @keys

   def build(status, result), do: %__MODULE__{status: status, result: result}
  def user_not_found, do: build(:not_found, "User cannot be found")
  def incorrect_id_format, do: build(:bad_request, "Invalid id format")
end
