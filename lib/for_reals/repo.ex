defmodule ForReals.Repo do
  use AshPostgres.Repo, otp_app: :for_reals

  def installed_extensions do
    ["uuid-ossp", "citext"]
  end
end
