defmodule Steiger.Chores.SchoolChore do
  use Ecto.Schema
  import Ecto.Changeset

  alias Steiger.Chores.School

  schema "school_chores" do
    field :quantity, :integer
    field :chore_id, :id

    belongs_to :school, School
    timestamps()
  end

  @doc false
  def changeset(school_chore, attrs) do
    school_chore
    |> cast(attrs, [:quantity])
    |> validate_required([:quantity])
  end
end
