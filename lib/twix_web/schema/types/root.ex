defmodule TwixWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias Crudry.Middlewares.TranslateErrors

  alias TwixWeb.Resolvers.User, as: UserResolver
  alias TwixWeb.Resolvers.Post, as: PostResolver

  import_types TwixWeb.Schema.Types.User
  import_types TwixWeb.Schema.Types.Post

  object :root_query do
    field :user, :user do
      arg :id, non_null(:id)
      resolve &UserResolver.get/2
    end

    field :post, :post do
      arg :id, non_null(:id)
      resolve &PostResolver.get/2
    end
  end

  object :root_mutation do
    field :add_like_to_post, :post do
      arg :id, non_null(:id)
      resolve &PostResolver.add_like/2
    end

    field :add_follower, :add_follower_response do
      arg :input, non_null(:add_follower_input)
      resolve &UserResolver.add_follower/2

      middleware TranslateErrors
    end

    field :create_user, :user do
      arg :input, non_null(:create_user_input)
      resolve &UserResolver.create/2

      middleware TranslateErrors
    end

    field :create_post, :post do
      arg :input, non_null(:create_post_input)
      resolve &PostResolver.create/2

      middleware TranslateErrors
    end

    field :update_user, :user do
      arg :input, non_null(:update_user_input)
      resolve &UserResolver.update/2

      middleware TranslateErrors
    end
  end
end
