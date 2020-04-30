defmodule TrackerWeb.HelloController do
  use TrackerWeb, :controller

  def world(conn, _params) do
    render conn, "world.html"
  end

  def show(conn, %{"name" => name}) do
    render conn, "show.html", name: name
  end

end
