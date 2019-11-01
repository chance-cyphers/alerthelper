defmodule AlerthelperApiWeb.EventController do
  use AlerthelperApiWeb, :controller
  require Logger

  def index(conn, params) do
    case params do
      %{"challenge" => msg} -> json(conn, msg)
      %{"event" => %{"type" => "app_mention"}} -> handle_app_mention(conn)
      _ -> json(conn, %{hello: "world"})
    end
  end

  defp handle_app_mention(conn) do
    send_resp(conn, 200, "")
    Logger.info("someone mentioned the app")

    token = Application.get_env(:alerthelper_api, :token)
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
    request_body = "{\"channel\": \"#so-many-alerts\", \"text\": \"what is my purpose\"}"

    HTTPoison.start()
    HTTPoison.post("https://slack.com/api/chat.postMessage", request_body, headers)
    Logger.info("posted a message to slack, maybe")
  end


end
