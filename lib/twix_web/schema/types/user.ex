defmodule TwixWeb.Schema.Types.User do
  use Absinthe.Schema.Notation

  @desc "A user of the application."
  object :user do
    field :id, non_null(:id)
    field :nickname, non_null(:string)
    field :email, non_null(:string)
    field :age, non_null(:integer), description: "Needs to be 18 or older."
    field :posts, list_of(:post)
    field :followers, list_of(:follower)
    field :followings, list_of(:following)
  end

  object :follower do
    field :follower_id, non_null(:id)
    field :follower, non_null(:user)
  end

  object :following do
    field :following_id, non_null(:id)
    field :following, non_null(:user)
  end

  object :add_follower_response do
    field :follower_id, non_null(:id)
    field :following_id, non_null(:id)
  end

  input_object :add_follower_input do
    field :user_id, non_null(:id)
    field :follower_id, non_null(:id)
  end

  input_object :create_user_input do
    field :nickname, non_null(:string)
    field :email, non_null(:string)
    field :age, non_null(:integer)
  end

  input_object :update_user_input do
    field :id, non_null(:id)
    field :nickname, :string
    field :email, :string
    field :age, :integer
  end
end
