defmodule CelestialProtocol.Decoder.Battle do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def mtlist(combinator \\ empty()) do
    combinator
    |> field(event("mtlist"), :event)
    |> ignore(separator())
    |> field(quantity(), :targets_amount)
    |> ignore(separator())
    |> repeated_field(target(), :targets)
  end

  def target(combinator \\ empty()) do
    combinator
    |> field(id(), :skill_id)
    |> ignore(separator())
    |> field(id(), :target_id)
  end
end
