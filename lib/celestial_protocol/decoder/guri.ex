defmodule CelestialProtocol.Decoder.Guri do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def say(combinator \\ empty()) do
    combinator
    |> field(event("say"), :event)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end
end
