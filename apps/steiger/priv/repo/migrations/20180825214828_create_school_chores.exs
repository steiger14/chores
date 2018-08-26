defmodule Steiger.Repo.Migrations.CreateSchoolChores do
  use Ecto.Migration

  def change do
    create table(:school_chores) do
      add :quantity, :integer
      add :school_id, references(:schools, on_delete: :delete_all)
      add :chore_id, references(:chores, on_delete: :delete_all)

      timestamps()
    end

    create index(:school_chores, [:school_id])
    create index(:school_chores, [:chore_id])
  end
end
