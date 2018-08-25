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
end
