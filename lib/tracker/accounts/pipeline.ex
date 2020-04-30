defmodule Tracker.Accounts.Pipeline do
    use Guardian.Plug.Pipeline,
    otp_app: :tracker,
    error_handler: Tracker.Accounts.ErrorHandler,
    module: Tracker.Accounts.Guardian

    plug Guardian.Plug.VerifySession, claims: %{"typ" => "access"}
    plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
    plug Guardian.Plug.LoadResource, allow_blank: true
end