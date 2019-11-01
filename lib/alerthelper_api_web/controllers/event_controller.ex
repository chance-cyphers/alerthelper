defmodule AlerthelperApiWeb.EventController do
  use AlerthelperApiWeb, :controller
  require Logger

  def index(conn, params) do
    case params do
      %{"challenge" => msg} -> json(conn, msg)
      %{"event" => %{"type" => "app_mention"} = event} -> handle_app_mention(conn, event)
      _ -> json(conn, %{hello: "world"})
    end
  end

  defp handle_app_mention(conn, event) do
    send_resp(conn, 200, "")
    Logger.info("someone mentioned the app: #{event}")
  end

end
