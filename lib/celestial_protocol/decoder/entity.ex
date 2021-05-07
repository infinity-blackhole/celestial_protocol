defmodule CelestialProtocol.Decoder.Entity do
  import NimbleParsec

  def character_sex(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:male),
      string("1") |> replace(:female)
    ])
  end

  def character_hair_style(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:a),
      string("1") |> replace(:b),
      string("2") |> replace(:c),
      string("3") |> replace(:d),
      string("4") |> replace(:shave)
    ])
  end

  def character_hair_color(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:mauve_taupe),
      string("1") |> replace(:cerise),
      string("2") |> replace(:san_marino),
      string("3") |> replace(:affair),
      string("4") |> replace(:dixie),
      string("5") |> replace(:raven),
      string("6") |> replace(:killarney),
      string("7") |> replace(:nutmeg),
      string("8") |> replace(:saddle),
      string("9") |> replace(:red)
    ])
  end

  def character_class(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:adventurer),
      string("1") |> replace(:sorcerer),
      string("2") |> replace(:archer),
      string("3") |> replace(:swordsman),
      string("4") |> replace(:martial_artist)
    ])
  end
end
