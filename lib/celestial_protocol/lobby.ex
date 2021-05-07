defmodule CelestialProtocol.Lobby do
  import NimbleParsec
  import CelestialProtocol.Helpers
  import CelestialProtocol.Entity

  def char_new(combinator \\ empty()) do
    combinator
    |> field(event("char_new"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(alphanum(), :character)
    |> ignore(separator())
    |> field(character_sexe(), :character_sex)
    |> ignore(separator())
    |> field(character_hair_style(), :character_hair_style)
    |> ignore(separator())
    |> field(character_hair_color(), :character_hair_color)
  end

  def select(combinator \\ empty()) do
    combinator
    |> field(event("select"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
  end

  def char_del(combinator \\ empty()) do
    combinator
    |> field(event("char_del"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(alphanum(), :password)
  end

  def char_ren(combinator \\ empty()) do
    combinator
    |> field(event("char_ren"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(alphanum(), :name)
  end
end
