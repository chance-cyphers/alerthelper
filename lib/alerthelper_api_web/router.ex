defmodule AlerthelperApiWeb.Router do
  use AlerthelperApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AlerthelperApiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

   scope "/api", AlerthelperApiWeb do
     pipe_through :api

     get "/hello", HelloController, :index
   end
end
