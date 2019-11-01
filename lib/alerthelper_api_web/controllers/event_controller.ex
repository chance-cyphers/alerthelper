defmodule AlerthelperApiWeb.EventController do
  use AlerthelperApiWeb, :controller

  def index(conn, params) do
    case params do
      %{"challenge" => msg} -> json(conn, msg)
      _ -> json(conn, %{hello: "world"})
    end
  end
end
