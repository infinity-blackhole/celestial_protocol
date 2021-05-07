defmodule CelestialProtocol.Guri do
  import NimbleParsec
  import CelestialProtocol.Helpers

  def say(combinator \\ empty()) do
    combinator
    |> field(event("say"), :event)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end
end
