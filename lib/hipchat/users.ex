defmodule Hipchat.Users do
  @moduledoc """
  Interacts with the user API on hipchat
  """

  alias Hipchat.HTTP
  
  @doc """
  Returns all users (defaults to 100)
  """
  def all(client) do
    users_url = HTTP.build_url("/v2/user")
    {_code, data} = HTTP.get(client, users_url)
    case data do
      %{"error" => _} -> []
      _ -> Enum.map data["items"], fn (k) -> %{name: k["name"], id: k["id"]} end
    end
  end

  @doc """
  Send a message to a user privately
  """
  def message(client, options) when is_list(options) do
    user = options[:user_id]
    user_notification_url = HTTP.build_url("/v2/user/#{user}/message")
    HTTP.post(client, user_notification_url, Keyword.delete(options, :user_id))
  end

  @doc """
  Finds a user and returns code and body
  """
  def find(client, user_id) do
   user_url = HTTP.build_url("/v2/user/#{user_id}")
   {code, body} = HTTP.get(client, user_url)
   {code, body}
  end
end
