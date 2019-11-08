defmodule AlerthelperApiWeb.Router do
  use AlerthelperApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", AlerthelperApiWeb do
    pipe_through :api

    post "/event", EventController, :index
    post "/interaction", InteractionController, :index
  end
end
