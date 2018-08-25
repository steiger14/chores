defmodule Steiger.ChoresTest do
  use Steiger.DataCase

  alias Steiger.Chores

  describe "schools" do
    alias Steiger.Chores.School

    @valid_attrs %{season: "some season", year: 42}
    @update_attrs %{season: "some updated season", year: 43}
    @invalid_attrs %{season: nil, year: nil}

    def school_fixture(attrs \\ %{}) do
      {:ok, school} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chores.create_school()

      school
    end

    test "list_schools/0 returns all schools" do
      school = school_fixture()
      assert Chores.list_schools() == [school]
    end

    test "get_school!/1 returns the school with given id" do
      school = school_fixture()
      assert Chores.get_school!(school.id) == school
    end

    test "create_school/1 with valid data creates a school" do
      assert {:ok, %School{} = school} = Chores.create_school(@valid_attrs)
      assert school.season == "some season"
      assert school.year == 42
    end

    test "create_school/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chores.create_school(@invalid_attrs)
    end

    test "update_school/2 with valid data updates the school" do
      school = school_fixture()
      assert {:ok, school} = Chores.update_school(school, @update_attrs)
      assert %School{} = school
      assert school.season == "some updated season"
      assert school.year == 43
    end

    test "update_school/2 with invalid data returns error changeset" do
      school = school_fixture()
      assert {:error, %Ecto.Changeset{}} = Chores.update_school(school, @invalid_attrs)
      assert school == Chores.get_school!(school.id)
    end

    test "delete_school/1 deletes the school" do
      school = school_fixture()
      assert {:ok, %School{}} = Chores.delete_school(school)
      assert_raise Ecto.NoResultsError, fn -> Chores.get_school!(school.id) end
    end

    test "change_school/1 returns a school changeset" do
      school = school_fixture()
      assert %Ecto.Changeset{} = Chores.change_school(school)
    end
  end

  describe "chores" do
    alias Steiger.Chores.Chore

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def chore_fixture(attrs \\ %{}) do
      {:ok, chore} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Chores.create_chore()

      chore
    end

    test "list_chores/0 returns all chores" do
      chore = chore_fixture()
      assert Chores.list_chores() == [chore]
    end

    test "get_chore!/1 returns the chore with given id" do
      chore = chore_fixture()
      assert Chores.get_chore!(chore.id) == chore
    end

    test "create_chore/1 with valid data creates a chore" do
      assert {:ok, %Chore{} = chore} = Chores.create_chore(@valid_attrs)
      assert chore.description == "some description"
      assert chore.name == "some name"
    end

    test "create_chore/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chores.create_chore(@invalid_attrs)
    end

    test "update_chore/2 with valid data updates the chore" do
      chore = chore_fixture()
      assert {:ok, chore} = Chores.update_chore(chore, @update_attrs)
      assert %Chore{} = chore
      assert chore.description == "some updated description"
      assert chore.name == "some updated name"
    end

    test "update_chore/2 with invalid data returns error changeset" do
      chore = chore_fixture()
      assert {:error, %Ecto.Changeset{}} = Chores.update_chore(chore, @invalid_attrs)
      assert chore == Chores.get_chore!(chore.id)
    end

    test "delete_chore/1 deletes the chore" do
      chore = chore_fixture()
      assert {:ok, %Chore{}} = Chores.delete_chore(chore)
      assert_raise Ecto.NoResultsError, fn -> Chores.get_chore!(chore.id) end
    end

    test "change_chore/1 returns a chore changeset" do
      chore = chore_fixture()
      assert %Ecto.Changeset{} = Chores.change_chore(chore)
    end
  end
end
