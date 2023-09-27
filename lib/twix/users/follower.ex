defmodule Twix.Users.Follower do
  use Ecto.Schema
  import Ecto.Changeset

  alias Twix.Users.User

  @required_params ~w(follower_id following_id)a
  @primary_key false

  schema "followers" do
    belongs_to :follower, User
    belongs_to :following, User

    timestamps()
  end

  @doc false
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> unique_constraint([:follower_id, :following_id])
  end
end
