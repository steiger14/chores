defmodule SteigerWeb.SchoolController do
  use SteigerWeb, :controller

  alias Steiger.Chores
  alias Steiger.Chores.School

  def index(conn, _params) do
    schools = Chores.list_schools()
    render(conn, "index.html", schools: schools)
  end

  def new(conn, _params) do
    changeset = Chores.change_school(%School{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"school" => school_params}) do
    case Chores.create_school(school_params) do
      {:ok, school} ->
        conn
        |> put_flash(:info, "School created successfully.")
        |> redirect(to: school_path(conn, :show, school))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    school = Chores.get_school!(id)
    render(conn, "show.html", school: school)
  end

  def edit(conn, %{"id" => id}) do
    school = Chores.get_school!(id)
    changeset = Chores.change_school(school)
    render(conn, "edit.html", school: school, changeset: changeset)
  end

  def update(conn, %{"id" => id, "school" => school_params}) do
    school = Chores.get_school!(id)

    case Chores.update_school(school, school_params) do
      {:ok, school} ->
        conn
        |> put_flash(:info, "School updated successfully.")
        |> redirect(to: school_path(conn, :show, school))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", school: school, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    school = Chores.get_school!(id)
    {:ok, _school} = Chores.delete_school(school)

    conn
    |> put_flash(:info, "School deleted successfully.")
    |> redirect(to: school_path(conn, :index))
  end
end
