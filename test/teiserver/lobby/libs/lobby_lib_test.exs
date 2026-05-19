defmodule Teiserver.Lobby.LobbyLibTest do
  alias Teiserver.Lobby.LobbyLib

  use ExUnit.Case, async: true

  test "validate_new_lobby expects name" do
    assert { :error, "No lobby name supplied" } = LobbyLib.validate_new_lobby(%{
      :name => nil
    })
    assert { :error, "No lobby name supplied" } = LobbyLib.validate_new_lobby(%{
      :name => ""
    })
  end

  test "validate_new_lobby rejects name over character limit" do
    limit = LobbyLib.max_name_length()

    assert { :error, "Lobby name too long" } = LobbyLib.validate_new_lobby(%{
      :name => String.duplicate("a", limit + 1)
    })

  end

  test "name_length_valid? rejects name over character limit" do
    limit = LobbyLib.max_name_length()

    assert not LobbyLib.name_length_valid?(String.duplicate("a", limit + 1))
  end
end
