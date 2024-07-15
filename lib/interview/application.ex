defmodule Interview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      InterviewWeb.Telemetry,
      # Start the Ecto repository
      Interview.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Interview.PubSub},
      # Start Finch
      {Finch, name: Interview.Finch},
      # Start the Endpoint (http/https)
      InterviewWeb.Endpoint
      # Start a worker by calling: Interview.Worker.start_link(arg)
      # {Interview.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Interview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    InterviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
