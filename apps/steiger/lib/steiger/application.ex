defmodule Steiger.Application do
  @moduledoc """
  The Steiger Application Service.

  The steiger system business domain lives in this application.

  Exposes API to clients such as the `SteigerWeb` application
  for use in channels, controllers, and elsewhere.
  """
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    Supervisor.start_link([
      supervisor(Steiger.Repo, []),
    ], strategy: :one_for_one, name: Steiger.Supervisor)
  end
end
