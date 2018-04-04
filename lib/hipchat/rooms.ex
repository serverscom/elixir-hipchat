defmodule Hipchat.Rooms do
  @moduledoc """
  Interacts with the room API on hipchat
  """

  alias Hipchat.HTTP
  
  @doc """
  Returns all rooms (defaults to 100)
  """
  def all(client) do
    rooms_url = HTTP.build_url("/v2/room")
    {_code, data} = HTTP.get(client, rooms_url)
    
    case data do
      %{"error" => _} -> []
      _ -> Enum.map data["items"], fn (k) -> k["name"] end
    end
  end

  @doc """
  Send a message to a room
  """
  def message(client, options) when is_list(options) do
    room = options[:room_id]
    room_notification_url = HTTP.build_url("/v2/room/#{room}/notification")
    HTTP.post(client, room_notification_url, Keyword.delete(options, :room_id))
  end

  @doc """
  Finds a room and return metadata
  """
  def find(client, room_id) do
   room_url = HTTP.build_url("/v2/room/#{room_id}")
   {code, body} = HTTP.get(client, room_url)
   {code, body}
  end
end
