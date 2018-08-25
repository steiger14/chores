defmodule SteigerWeb.Router do
  use SteigerWeb, :router

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

  scope "/", SteigerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    resources "/schools", SchoolController
  end

  # Other scopes may use custom stacks.
  # scope "/api", SteigerWeb do
  #   pipe_through :api
  # end
end
