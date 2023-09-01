defmodule Twix.Users.Create do
  alias Twix.Repo
  alias Twix.Users.User

  def call(params) do
    %User{}
    |> User.changeset(params)
    |> Repo.insert()
  end
end
