defmodule CelestialProtocol.Decoder.Network do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def mz(combinator \\ empty()) do
    combinator
    |> field(event("mz"), :event)
    |> ignore(separator())
    |> field(id(), :ip)
    |> ignore(separator())
    |> field(integer(min: 1), :port)
    |> ignore(separator())
    |> field(index(), :slot)
  end
end
