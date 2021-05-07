defmodule CelestialProtocol.Encoder.Lobby do
  import CelestialProtocol.Encoder.Helpers
  import CelestialProtocol.Encoder.Entity

  @pets_terminator "-1"

  def encode_clist_start(clists_start) do
    encode_list([clists_start.length])
  end

  def encode_clist(clist) do
    encode_list([
      encode_int(clist.index),
      clist.character.name,
      encode_int(0),
      encode_sex(clist.character.sex),
      encode_hair_style(clist.character.hair_style),
      encode_hair_color(clist.character.hair_color),
      encode_int(0),
      encode_class(clist.character.class),
      encode_int(clist.character.level),
      encode_int(clist.character.hero_level),
      encode_equipments(clist.character.equipment),
      encode_int(clist.character.job_level),
      encode_int("1"),
      encode_int("1"),
      clist.character.pets
      |> Enum.map(&encode_pet/1)
      |> encode_list(@pets_terminator),
      encode_int("0")
    ])
  end

  defp encode_pet(pet) do
    encode_struct([
      encode_int(pet.skin.id),
      encode_int(pet.id)
    ])
  end
end
