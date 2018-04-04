defmodule HipchatUsersTest do
  use ExUnit.Case

  test "hipchat.rooms.all returns all rooms" do
    client = [token: System.get_env("TOKEN")]
    assert is_list Hipchat.Users.all(client)
  end

  test "hipchat.users.find returns a map of a user" do
    client = [token: System.get_env("TOKEN")]
    {code, _user} = Hipchat.Users.find(client, "icantpossiblyexistonyouserver")
    assert code == 404
  end
end
