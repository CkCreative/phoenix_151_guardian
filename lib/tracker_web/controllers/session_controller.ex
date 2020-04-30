defmodule TrackerWeb.SessionController do
    use TrackerWeb, :controller

    alias Tracker.{Accounts, Accounts.User, Accounts.Guardian}

    def new(conn, _) do
        changeset = Accounts.change_user(%User{})
        maybe_user = Guardian.Plug.current_resource(conn)
        if maybe_user do
            redirect(conn, to: "/products")
        else
            render(conn, "new.html", changeset: changeset, action: Routes.session_path(conn, :login))
        end
    end

    def login(conn, %{"user" => %{"email" => email, "password" => password}}) do
        Accounts.authenticate_user(email, password)
        |> login_reply(conn)
    end

    def logout(conn, _) do
        conn
        |> Guardian.Plug.sign_out()
        |> redirect(to: "/login")
    end

    defp login_reply({:ok, user}, conn) do
        conn
        |> put_flash(:info, "Welcome back!")
        |> Guardian.Plug.sign_in(user)
        |> redirect(to: "/products")
    end

    defp login_reply({:error, reason}, conn) do
        conn
        |> put_flash(:error, to_string(reason))
        |> new(%{})
    end
end
