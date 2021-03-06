defmodule Vdemo2017Web.Router do
  use Vdemo2017Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Vdemo2017Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/slides", SlideController, :index
    post "/start_stream", SlideController, :start_stream
    post "/vote/:vote", SlideController, :vote
  end

  # Other scopes may use custom stacks.
  # scope "/api", Vdemo2017Web do
  #   pipe_through :api
  # end
end
