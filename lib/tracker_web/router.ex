defmodule TrackerWeb.Router do
  use TrackerWeb, :router

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

  pipeline :auth do
    plug Tracker.Accounts.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  scope "/", TrackerWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index
    get "/hello", HelloController, :world
    get "/hello/:name", HelloController, :show
    
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
    
    resources "/users", UserController 

  end

  scope "/", TrackerWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/products", ProductController 
  end
  
  # Other scopes may use custom stacks.
  # scope "/api", TrackerWeb do
  #   pipe_through :api
  # end
end
