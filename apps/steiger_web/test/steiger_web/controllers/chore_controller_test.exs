defmodule SteigerWeb.ChoreControllerTest do
  use SteigerWeb.ConnCase

  alias Steiger.Chores

  @create_attrs %{description: "some description", name: "some name"}
  @update_attrs %{description: "some updated description", name: "some updated name"}
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:chore) do
    {:ok, chore} = Chores.create_chore(@create_attrs)
    chore
  end

  describe "index" do
    test "lists all chores", %{conn: conn} do
      conn = get conn, chore_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Chores"
    end
  end

  describe "new chore" do
    test "renders form", %{conn: conn} do
      conn = get conn, chore_path(conn, :new)
      assert html_response(conn, 200) =~ "New Chore"
    end
  end

  describe "create chore" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, chore_path(conn, :create), chore: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == chore_path(conn, :show, id)

      conn = get conn, chore_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Chore"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, chore_path(conn, :create), chore: @invalid_attrs
      assert html_response(conn, 200) =~ "New Chore"
    end
  end

  describe "edit chore" do
    setup [:create_chore]

    test "renders form for editing chosen chore", %{conn: conn, chore: chore} do
      conn = get conn, chore_path(conn, :edit, chore)
      assert html_response(conn, 200) =~ "Edit Chore"
    end
  end

  describe "update chore" do
    setup [:create_chore]

    test "redirects when data is valid", %{conn: conn, chore: chore} do
      conn = put conn, chore_path(conn, :update, chore), chore: @update_attrs
      assert redirected_to(conn) == chore_path(conn, :show, chore)

      conn = get conn, chore_path(conn, :show, chore)
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, chore: chore} do
      conn = put conn, chore_path(conn, :update, chore), chore: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Chore"
    end
  end

  describe "delete chore" do
    setup [:create_chore]

    test "deletes chosen chore", %{conn: conn, chore: chore} do
      conn = delete conn, chore_path(conn, :delete, chore)
      assert redirected_to(conn) == chore_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, chore_path(conn, :show, chore)
      end
    end
  end

  defp create_chore(_) do
    chore = fixture(:chore)
    {:ok, chore: chore}
  end
end
