defmodule TwixWeb.Resolvers.Post do
  def get(%{id: id}, _context), do: Twix.get_post(id)
end
