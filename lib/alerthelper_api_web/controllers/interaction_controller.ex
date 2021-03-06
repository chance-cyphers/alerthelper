defmodule AlerthelperApiWeb.InteractionController do
  use AlerthelperApiWeb, :controller
  require Logger

  def index(conn, params) do
    Logger.info("someone interacted with the app: #{params}")

    case params do
      _ -> json(conn, %{hello: "interactions"})
    end
  end

end
