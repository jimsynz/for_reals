defmodule ForReals.Accounts.User do
  use Ash.Resource, data_layer: AshPostgres.DataLayer, extensions: [AshAuthentication]
  require Logger

  attributes do
    uuid_primary_key :id
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  actions do
    defaults [:read]
  end

  authentication do
    api ForReals.Accounts

    strategies do
      password do
        identity_field :email

        resettable do
          sender fn user, token, _ ->
            Logger.info("Password reset link http://localhost:4000/password-reset/#{token}")
          end
        end
      end
    end

    tokens do
      enabled? true
      token_resource ForReals.Accounts.Token
      signing_secret "WAT"
    end
  end

  identities do
    identity :unique_email, [:email]
  end

  postgres do
    table "users"
    repo ForReals.Repo
  end
end
