defmodule Steiger.Repo.Migrations.CreateSchools do
  use Ecto.Migration

  def change do
    create table(:schools) do
      add :year, :integer
      add :season, :string

      timestamps()
    end

  end
end
