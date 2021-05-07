defmodule CelestialProtocol.Decoder.Instances do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def bsc(combinator \\ empty()) do
    combinator
    |> field(event("bsc"), :event)
    |> ignore(separator())
    |> field(instance_type(), :type)
    |> ignore(separator())
    |> field(integer(min: 1), :option)
  end

  def instance_type(combinator \\ empty()) do
    combinator |> string("2") |> replace(:talent_arena)
  end

  def espace(combinator \\ empty()) do
    combinator
    |> field(event("espace"), :event)
  end

  def git(combinator \\ empty()) do
    combinator
    |> field(event("git"), :event)
    |> ignore(separator())
    |> field(alphanum(), :button_id)
  end

  def mkraid(combinator \\ empty()) do
    combinator
    |> field(event("mkraid"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(integer(min: 1), :parameters)
  end
end
