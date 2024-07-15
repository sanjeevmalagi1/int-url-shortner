defmodule InterviewWeb.V1.URLController do
  use InterviewWeb, :controller

  alias Interview.Url

  def create(conn, %{ "url" => url }) do
    Url.create_url(url)
    |> case do
      {:ok, url_details} ->
        conn
        |> put_status(:ok)
        |> render(:create, %{url_details: url_details})

      {:error, __changeset} ->
        conn
        |> put_status(:bad_request)
        |> halt()
    end

  end

  def get(conn, %{ "id" => id }) do

    %{ url: url } = Url.get_url_by_id(id)

    conn |> redirect(external: url) |> halt()

  end
end
