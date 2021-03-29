defmodule Rocketlivery do
  alias Rocketlivery.Users.Create, as: UserCreate
  alias Rocketlivery.Users.Get, as: UserGet
  alias Rocketlivery.Users.Delete, as: UserDelete
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_by_id(id), to: UserGet, as: :by_id
  defdelegate delete_user(id), to: UserDelete, as: :call

end
