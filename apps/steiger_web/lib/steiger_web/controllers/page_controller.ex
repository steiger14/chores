defmodule SteigerWeb.PageController do
  use SteigerWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
