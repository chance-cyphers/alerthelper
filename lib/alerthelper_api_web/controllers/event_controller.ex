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
    Logger.info("someone mentioned the app")

    token = System.get_env("BOT_TOKEN")
    headers = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"}
    ]
    request_body = "{\"channel\": \"#so-many-alerts\", \"text\": \"what is my purpose\"}"

    Logger.info("here's a tokens: #{token}")

    HTTPoison.start()
    HTTPoison.post("https://slack.com/api/chat.postMessage", request_body, headers)
    Logger.info("posted a message to slack, maybe")
    send_resp(conn, 200, token)
  end


end
