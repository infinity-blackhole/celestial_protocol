defmodule CelestialProtocol.Decoder.Client do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def c_close(combinator \\ empty()) do
    combinator
    |> field(event("c_close"), :event)
  end

  def gop(combinator \\ empty()) do
    combinator
    |> field(event("gop"), :event)
    |> ignore(separator())
    |> field(character_options(), :active?)
    |> ignore(separator())
    |> field(bool(), :active?)
  end

  def character_options(combinator \\ empty()) do
    choice(combinator, [
      string("1") |> replace(:exchange_blocked),
      string("2") |> replace(:friend_request_blocked),
      string("3") |> replace(:family_request_blocked),
      string("4") |> replace(:whisper_blocked),
      string("5") |> replace(:group_request_blocked),
      string("8") |> replace(:group_sharing),
      string("9") |> replace(:mouse_aim_lock),
      string("10") |> replace(:hero_chat_blocked),
      string("12") |> replace(:emoticons_blocked),
      string("11") |> replace(:quick_get_up),
      string("13") |> replace(:hp_blocked),
      string("14") |> replace(:buff_blocked),
      string("15") |> replace(:miniland_invite_blocked)
    ])
  end

  def f_stash_end(combinator \\ empty()) do
    combinator
    |> field(event("f_stash_end"), :event)
  end

  def lbs(combinator \\ empty()) do
    combinator
    |> field(event("lbs"), :event)
    |> ignore(separator())
    |> field(character_options(), :type)
  end
end
