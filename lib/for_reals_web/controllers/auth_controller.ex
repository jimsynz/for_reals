defmodule ForRealsWeb.AuthController do
  use ForRealsWeb, :controller
  use AshAuthentication.Phoenix.Controller

  def success(conn, {:password, :reset}, _user, _token) do
    conn
    |> put_flash(:info, "Password changed")
    |> redirect_back()
  end

  def success(conn, _activity, user, _token) do
    conn
    |> store_in_session(user)
    |> put_flash(:info, "Welcome back!")
    |> redirect_back()
  end

  def failure(conn, _activity, _reason) do
    conn
    |> put_status(401)
    |> put_flash(:error, "Authentication failed")
    |> render("failure.html")
  end

  def sign_out(conn, _params) do
    conn
    |> clear_session()
    |> redirect_back()
  end

  defp redirect_back(conn) do
    return_to = get_session(conn, :return_to) || ~p"/"

    conn
    |> delete_session(:return_to)
    |> redirect(to: return_to)
  end
end
