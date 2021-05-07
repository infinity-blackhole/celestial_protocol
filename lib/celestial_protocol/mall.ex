defmodule CelestialProtocol.Mall do
  import NimbleParsec
  import CelestialProtocol.Helpers

  def mall(combinator \\ empty()) do
    combinator
    |> field(event("mall"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
  end
end
