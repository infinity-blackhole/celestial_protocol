defmodule CelestialProtocol.Decoder.Economy do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def exc_list(combinator \\ empty()) do
    combinator
    |> field(event("exc_list"), :event)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  def req_exc(combinator \\ empty()) do
    combinator
    |> field(event("req_exc"), :event)
    |> ignore(separator())
    |> field(request_type(), :request_type)
    |> ignore(separator())
    |> field(id(), :character_id)
  end

  defp request_type(combinator \\ empty()) do
    choice(combinator, [
      string("1") |> replace(:requested),
      string("2") |> replace(:list),
      string("3") |> replace(:confirmed),
      string("4") |> replace(:cancelled),
      string("5") |> replace(:declined)
    ])
  end
end
