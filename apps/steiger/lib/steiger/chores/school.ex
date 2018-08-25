defmodule Steiger.Chores.School do
  use Ecto.Schema
  import Ecto.Changeset


  schema "schools" do
    field :season, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(school, attrs) do
    school
    |> cast(attrs, [:year, :season])
    |> validate_required([:year, :season])
  end
end
