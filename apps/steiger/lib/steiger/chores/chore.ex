defmodule Steiger.Chores.Chore do
  use Ecto.Schema
  import Ecto.Changeset


  schema "chores" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(chore, attrs) do
    chore
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
