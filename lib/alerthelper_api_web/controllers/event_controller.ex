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
    Logger.info("someone mentioned the app in channel: #{event["channel"]}")

    token = Application.get_env(:alerthelper_api, :token)
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
    request_body = "{\"channel\": \"#so-many-alerts\", \"text\": \"what is my purpose\"}"

    HTTPoison.start()
    HTTPoison.post("https://slack.com/api/chat.postMessage", request_body, headers)
  end


end
