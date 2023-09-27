defmodule Twix.Repo.Migrations.CreateFollowers do
  @moduledoc false
  use Ecto.Migration

  def change do
    create table(:followers, primary_key: false) do
      add :follower_id, references(:users, on_delete: :delete_all)
      add :following_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:followers, [:follower_id, :following_id])
  end
end
