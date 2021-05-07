defmodule CelestialProtocol.Map do
  import NimbleParsec
  import CelestialProtocol.Helpers

  def dir(combinator \\ empty()) do
    combinator
    |> field(event("dir"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :option)
    |> ignore(separator())
    |> field(direction(), :direction)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def direction(combinator \\ empty()) do
    choice(combinator, [
      string("1") |> replace(:north),
      string("2") |> replace(:east),
      string("3") |> replace(:south),
      string("4") |> replace(:west),
      string("5") |> replace(:north_east),
      string("6") |> replace(:south_east),
      string("7") |> replace(:south_west),
      string("8") |> replace(:north_west)
    ])
  end
end
