defmodule CelestialProtocol.Decoder.Game do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def game_start(combinator \\ empty()) do
    combinator
    |> field(event("game_start"), :event)
  end
end
