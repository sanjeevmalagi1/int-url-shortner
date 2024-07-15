defmodule InterviewWeb.V1.URLJSON do

  def create(%{url_details: url_details}) do
    %{
      shortened_url: "#{InterviewWeb.Endpoint.url()}/api/v1/url/#{url_details.id}",
    }
  end

end
