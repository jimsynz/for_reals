defmodule ForReals.Accounts.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry ForReals.Accounts.User
    entry ForReals.Accounts.Token
  end
end
