defmodule Twix.Posts.Create do
  alias Twix.Repo
  alias Twix.Posts.Post

  def call(params) do
    %Post{}
    |> Post.changeset(params)
    |> Repo.insert()
  end
end
