defmodule AlerthelperApiWeb.Router do
  use AlerthelperApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlerthelperApiWeb do
    pipe_through :api

    get "/hello", HelloController, :index

    post "/event", EventController, :index
  end
end
