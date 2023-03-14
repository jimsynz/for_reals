defmodule ForReals.Accounts do
  use Ash.Api, extensions: [AshAdmin.Api]

  admin do
    show? true
  end

  resources do
    registry ForReals.Accounts.Registry
  end
end
