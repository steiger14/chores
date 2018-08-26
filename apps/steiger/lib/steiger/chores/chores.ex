defmodule Steiger.Chores do
  @moduledoc """
  The Chores context.
  """

  import Ecto.Query, warn: false
  alias Steiger.Repo

  alias Steiger.Chores.School
  alias Steiger.Chores.Chore
  alias Steiger.Chores.SchoolChore

  @doc """
  Returns the list of schools.

  ## Examples

      iex> list_schools()
      [%School{}, ...]

  """
  def list_schools do
    Repo.all(School)
  end

  @doc """
  Gets a single school.

  Raises `Ecto.NoResultsError` if the School does not exist.

  ## Examples

      iex> get_school!(123)
      %School{}

      iex> get_school!(456)
      ** (Ecto.NoResultsError)

  """
  def get_school!(id), do: Repo.get!(School, id)

  @doc """
  Creates a school.

  ## Examples

      iex> create_school(%{field: value})
      {:ok, %School{}}

      iex> create_school(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_school(attrs \\ %{}) do
    %School{}
    |> School.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, school} ->
        Enum.each(list_chores(), fn(%Chore{id: chore_id}) ->
           %SchoolChore{}
           |> SchoolChore.changeset(%{school_id: school.id, chore_id: chore_id, quantity: 0})
           |> Repo.insert!()
        end)




        {:ok, school}

      {:error, changeset} ->
        {:error, changeset}
    end
  end

  @doc """
  Updates a school.

  ## Examples

      iex> update_school(school, %{field: new_value})
      {:ok, %School{}}

      iex> update_school(school, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_school(%School{} = school, attrs) do
    school
    |> School.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a School.

  ## Examples

      iex> delete_school(school)
      {:ok, %School{}}

      iex> delete_school(school)
      {:error, %Ecto.Changeset{}}

  """
  def delete_school(%School{} = school) do
    Repo.delete(school)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking school changes.

  ## Examples

      iex> change_school(school)
      %Ecto.Changeset{source: %School{}}

  """
  def change_school(%School{} = school) do
    School.changeset(school, %{})
  end

  @doc """
  Returns the list of chores.

  ## Examples

      iex> list_chores()
      [%Chore{}, ...]

  """
  def list_chores do
    Repo.all(Chore)
  end

  @doc """
  Gets a single chore.

  Raises `Ecto.NoResultsError` if the Chore does not exist.

  ## Examples

      iex> get_chore!(123)
      %Chore{}

      iex> get_chore!(456)
      ** (Ecto.NoResultsError)

  """
  def get_chore!(id), do: Repo.get!(Chore, id)

  @doc """
  Creates a chore.

  ## Examples

      iex> create_chore(%{field: value})
      {:ok, %Chore{}}

      iex> create_chore(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_chore(attrs \\ %{}) do
    %Chore{}
    |> Chore.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a chore.

  ## Examples

      iex> update_chore(chore, %{field: new_value})
      {:ok, %Chore{}}

      iex> update_chore(chore, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_chore(%Chore{} = chore, attrs) do
    chore
    |> Chore.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Chore.

  ## Examples

      iex> delete_chore(chore)
      {:ok, %Chore{}}

      iex> delete_chore(chore)
      {:error, %Ecto.Changeset{}}

  """
  def delete_chore(%Chore{} = chore) do
    Repo.delete(chore)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking chore changes.

  ## Examples

      iex> change_chore(chore)
      %Ecto.Changeset{source: %Chore{}}

  """
  def change_chore(%Chore{} = chore) do
    Chore.changeset(chore, %{})
  end
end
