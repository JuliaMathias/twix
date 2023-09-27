defmodule Twix do
  alias Twix.Posts
  alias Twix.Users

  defdelegate create_user(params), to: Users.Create, as: :call
  defdelegate get_user(id), to: Users.Get, as: :call
  defdelegate update_user(params), to: Users.Update, as: :call

  defdelegate create_post(params), to: Posts.Create, as: :call
  defdelegate get_post(id), to: Posts.Get, as: :call
  defdelegate add_like_to_post(id), to: Posts.AddLike, as: :call

  defdelegate add_follower(user_id, follower_id), to: Users.Follow, as: :call
end
