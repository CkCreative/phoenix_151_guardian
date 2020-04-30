defmodule Tracker.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :title, :string
      add :sku, :string

      timestamps()
    end

  end
end
