defmodule ForReals.Accounts.Token do
  use Ash.Resource,
    data_layer: Ash.DataLayer.Ets,
    extensions: [AshAuthentication.TokenResource]

  token do
    api ForReals.Accounts
  end
end
