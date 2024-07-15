defmodule Interview.Url do
  import Ecto.Query

  alias Interview.UrlSchema
  alias Interview.Repo

  def create_url(given_url) do
    %UrlSchema{}
    |> UrlSchema.changeset(%{url: given_url})
    |> Repo.insert()
  end

  def get_url_by_id(id) do
    UrlSchema
    |> Repo.get(id)
  end
end
