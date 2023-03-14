defmodule ForReals.Accounts.User do
  use Ash.Resource, data_layer: AshPostgres.DataLayer

  attributes do
    uuid_primary_key :id
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  actions do
    defaults [:read]
  end

  postgres do
    table "users"
    repo ForReals.Repo
  end
end
