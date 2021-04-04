defmodule RocketLiveryWeb.Plugs.UUIDChecker do
	import Plug.Conn
  alias Plug.Conn
	alias Ecto.UUID
	 ## this is the first function a plugin needs to have
	def init(options), do: options

	def call(%Conn{params: %{"id" => id}} = conn, _options)do
		case UUID.cast(id) do
			:error -> render_error(conn)
			{:ok, _uuid} -> conn
		end
	## logic goes here.
	end
	## this way we only validate the routes with param.id
	def call(conn, _options), do: conn

	#halt ends the connection
	defp render_error(conn) do
		body = Jason.encode!(%{message: "Invalid UUID"})
		conn
		|>put_resp_content_type("application/json")
		|>send_resp(:bad_request, body)
		|>halt()
	end
end
