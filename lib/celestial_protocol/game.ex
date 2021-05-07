defmodule CelestialProtocol.Game do
  import NimbleParsec
  import CelestialProtocol.Helpers

  def game_start(combinator \\ empty()) do
    combinator
    |> field(event("game_start"), :event)
  end
end
