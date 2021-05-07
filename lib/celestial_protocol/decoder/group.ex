defmodule CelestialProtocol.Decoder.Group do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def guri(combinator \\ empty()) do
    combinator
    |> field(event("guri"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(integer(min: 1), :argument)
    |> ignore(separator())
    |> field(integer(min: 1), :user)
    |> ignore(separator())
    |> field(integer(min: 1), :data)
    |> ignore(separator())
    |> field(alphanum(), :value)
  end
end
