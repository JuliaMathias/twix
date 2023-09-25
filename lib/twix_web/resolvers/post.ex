defmodule TwixWeb.Resolvers.Post do
  def get(%{id: id}, _context), do: Twix.get_post(id)

  def create(%{input: params}, _context), do: Twix.create_post(params)
end
