defmodule CelestialProtocol.Decoder.Social do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def blins(combinator \\ empty()) do
    combinator
    |> field(event("blins"), :event)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def btk(combinator \\ empty()) do
    combinator
    |> field(event("btk"), :event)
    |> ignore(separator())
    |> field(id(), :character_id)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end

  def compl(combinator \\ empty()) do
    combinator
    |> field(event("compl"), :event)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def fdel(combinator \\ empty()) do
    combinator
    |> field(event("fdel"), :event)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def fins(combinator \\ empty()) do
    combinator
    |> field(event("fins"), :event)
    |> ignore(separator())
    |> field(friend_invitation_type(), :friend_invitation_type)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def friend_invitation_type(combinator \\ empty()) do
    choice(combinator, [
      string("1") |> replace(:added),
      string("2") |> replace(:rejected),
      string("3") |> replace(:full)
    ])
  end

  def pcl(combinator \\ empty()) do
    combinator
    |> field(event("pcl"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(id(), :gift_id)
  end

  def hero(combinator \\ empty()) do
    combinator
    |> field(event("hero"), :event)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end

  def ncif(combinator \\ empty()) do
    combinator
    |> field(event("ncif"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(id(), :target_id)
  end

  def npinfo(combinator \\ empty()) do
    combinator
    |> field(event("npinfo"), :event)
    |> ignore(separator())
    |> field(quantity(), :page_number)
  end
end
