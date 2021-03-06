defmodule PhoenixCrudWeb.Router do
  use PhoenixCrudWeb, :router

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

  scope "/", PhoenixCrudWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:msg", HelloController, :show

    resources "/exercises", ExerciseController

  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixCrudWeb do
  #   pipe_through :api
  # end
end
