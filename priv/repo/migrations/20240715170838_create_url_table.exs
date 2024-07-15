defmodule Interview.Repo.Migrations.CreateUrlTable do
  use Ecto.Migration

  def change do
    create table("url", primary_key: false) do
      add :id, :uuid, primary_key: true
      add :url, :string

      timestamps()
    end
  end
end
