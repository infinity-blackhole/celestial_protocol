defmodule CelestialProtocol.Miniland do
  import NimbleParsec
  import CelestialProtocol.Helpers

  def addobj(combinator \\ empty()) do
    combinator
    |> field(event("addobj"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(coordinate(), :coordinate_x)
    |> ignore(separator())
    |> field(coordinate(), :coordinate_y)
  end

  def coordinate(combinator \\ empty()) do
    integer(combinator, min: 1)
  end

  def mjoin(combinator \\ empty()) do
    combinator
    |> field(event("mjoin"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def mledit(combinator \\ empty()) do
    combinator
    |> field(event("mledit"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(integer(min: 1), :parameters)
  end

  def mg(combinator \\ empty()) do
    combinator
    |> field(event("mg"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(id(), :id)
    |> ignore(separator())
    |> field(quantity(), :minigame_vnum)
    |> ignore(separator())
    |> field(optional(quantity()), :point)
  end
end
