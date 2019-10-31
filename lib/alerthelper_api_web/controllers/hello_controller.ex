defmodule AlerthelperApiWeb.HelloController do
  use AlerthelperApiWeb, :controller

  def index(conn, _params) do
    json(conn, "hello world")
  end
end
