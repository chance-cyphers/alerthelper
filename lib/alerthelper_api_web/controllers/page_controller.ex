defmodule AlerthelperApiWeb.PageController do
  use AlerthelperApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
