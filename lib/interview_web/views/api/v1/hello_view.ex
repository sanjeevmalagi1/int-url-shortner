defmodule InterviewWeb.Api.V1.HelloView do

  def render("hello.json", %{ message: message }) do
    %{
      message: message,
      api_version: "v1"
    }
  end
end
