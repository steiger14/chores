defmodule SteigerWeb.ChoreController do
  use SteigerWeb, :controller

  alias Steiger.Chores
  alias Steiger.Chores.Chore

  def index(conn, _params) do
    chores = Chores.list_chores()
    render(conn, "index.html", chores: chores)
  end

  def new(conn, _params) do
    changeset = Chores.change_chore(%Chore{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"chore" => chore_params}) do
    case Chores.create_chore(chore_params) do
      {:ok, chore} ->
        conn
        |> put_flash(:info, "Chore created successfully.")
        |> redirect(to: chore_path(conn, :show, chore))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    chore = Chores.get_chore!(id)
    render(conn, "show.html", chore: chore)
  end

  def edit(conn, %{"id" => id}) do
    chore = Chores.get_chore!(id)
    changeset = Chores.change_chore(chore)
    render(conn, "edit.html", chore: chore, changeset: changeset)
  end

  def update(conn, %{"id" => id, "chore" => chore_params}) do
    chore = Chores.get_chore!(id)

    case Chores.update_chore(chore, chore_params) do
      {:ok, chore} ->
        conn
        |> put_flash(:info, "Chore updated successfully.")
        |> redirect(to: chore_path(conn, :show, chore))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", chore: chore, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    chore = Chores.get_chore!(id)
    {:ok, _chore} = Chores.delete_chore(chore)

    conn
    |> put_flash(:info, "Chore deleted successfully.")
    |> redirect(to: chore_path(conn, :index))
  end
end
