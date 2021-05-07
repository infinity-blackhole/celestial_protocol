defmodule CelestialProtocol.Encoder.Entity do
  import CelestialProtocol.Encoder.{
    Map,
    Society,
    HUD,
    Helpers
  }

  def encode_c_info(c_info) do
    encode_list([
      encode_string(c_info.entity.name),
      encode_string(""),
      encode_int(c_info.group_id),
      encode_int(c_info.family_id),
      encode_string(c_info.family_name),
      encode_int(c_info.entity.id),
      encode_name_color(c_info.name_color),
      encode_sex(c_info.entity.sex),
      encode_hair_style(c_info.entity.hair_style),
      encode_hair_color(c_info.entity.hair_color),
      encode_class(c_info.entity.class),
      encode_reputation(c_info.entity.reputation),
      encode_int(c_info.entity.compliment),
      encode_int(c_info.morph),
      encode_bool(c_info.invisible?),
      encode_int(c_info.family_level),
      encode_int(c_info.morph_upgrade),
      encode_bool(c_info.arena_winner?)
    ])
  end

  def encode_tit(tit) do
    encode_list([
      encode_string(tit.title),
      encode_string(tit.name)
    ])
  end

  def encode_fd(fd) do
    encode_list([
      encode_reputation(fd.entity.reputation),
      encode_int(dignity_icon(fd.entity.reputation)),
      encode_dignity(fd.entity.dignity),
      encode_int(reputation(fd.entity.dignity))
    ])
  end

  def encode_lev(lev) do
    encode_list([
      encode_int(lev.entity.level),
      encode_int(lev.entity.job_level),
      encode_int(lev.entity.job_xp),
      encode_int(lev.entity.xp_max),
      encode_int(lev.entity.job_xp_max),
      encode_reputation(lev.entity.reputation),
      encode_int(lev.cp),
      encode_int(lev.entity.hero_xp),
      encode_int(lev.entity.hero_level),
      encode_int(lev.entity.hero_xp_max)
    ])
  end

  def encode_at(at) do
    encode_list([
      encode_int(at.id),
      encode_int(at.map.id),
      encode_int(at.position.coordinate_x),
      encode_int(at.position.coordinate_y),
      "2",
      encode_int("0"),
      encode_int(at.ambiance.id),
      "-1"
    ])
  end

  def encode_in(in_) do
    encode_list([
      encode_type(in_.type),
      encode_string(in_.entity.name),
      encode_string(""),
      encode_int(in_.id),
      encode_int(in_.entity.position.coordinate_x),
      encode_int(in_.entity.position.coordinate_y),
      encode_direction(in_.entity.position.direction),
      encode_name_color(in_.name_color),
      encode_sex(in_.entity.sex),
      encode_hair_style(in_.entity.hair_style),
      encode_hair_color(in_.entity.hair_color),
      encode_class(in_.entity.class),
      encode_equipments(in_.entity.equipment),
      encode_int(in_.hp_percent),
      encode_int(in_.mp_percent),
      encode_bool(in_.sitting?),
      encode_int(in_.group_id),
      encode_fairy_movement(in_.fairy_movement),
      encode_fairy_element(in_.fairy_element),
      encode_int(0),
      encode_int(in_.fairy_morph),
      encode_int(0),
      encode_int(in_.morph),
      encode_int(in_.weapon_upgrade),
      encode_int(in_.armor_upgrade),
      encode_int(in_.family_id),
      encode_string(in_.family_name),
      encode_reputation(in_.entity.reputation),
      encode_bool(in_.invisible?),
      encode_int(in_.morph_upgrade),
      encode_faction(in_.entity.faction),
      encode_int(in_.morph_bonus),
      encode_int(in_.entity.level),
      encode_int(in_.family_level),
      encode_string(in_.family_icons),
      encode_int(in_.entity.compliment),
      encode_int(in_.size),
      encode_int(0),
      encode_int(0),
      encode_int(0)
    ])
  end

  def encode_type(:character), do: encode_int(1)
  def encode_type(:npc), do: encode_int(2)
  def encode_type(:monster), do: encode_int(3)
  def encode_type(:map_object), do: encode_int(9)
  def encode_type(:portal), do: encode_int(1000)

  def encode_sex(:male), do: encode_int(0)
  def encode_sex(:female), do: encode_int(1)

  def encode_hair_style(:adventurer), do: encode_int(0)
  def encode_hair_style(:sorcerer), do: encode_int(1)
  def encode_hair_style(:archer), do: encode_int(2)
  def encode_hair_style(:swordsman), do: encode_int(3)
  def encode_hair_style(:martial_artist), do: encode_int(4)

  def encode_hair_color(:mauve_taupe), do: encode_int(0)
  def encode_hair_color(:cerise), do: encode_int(1)
  def encode_hair_color(:san_marino), do: encode_int(2)
  def encode_hair_color(:affair), do: encode_int(3)
  def encode_hair_color(:dixie), do: encode_int(4)
  def encode_hair_color(:raven), do: encode_int(5)
  def encode_hair_color(:killarney), do: encode_int(6)
  def encode_hair_color(:nutmeg), do: encode_int(7)
  def encode_hair_color(:saddle), do: encode_int(8)
  def encode_hair_color(:red), do: encode_int(9)

  def encode_fairy_movement(:neutral), do: encode_int(0)
  def encode_fairy_movement(:god), do: encode_int(1)

  def encode_fairy_element(:neutral), do: encode_int(1)
  def encode_fairy_element(:fire), do: encode_int(2)
  def encode_fairy_element(:water), do: encode_int(3)
  def encode_fairy_element(:light), do: encode_int(4)
  def encode_fairy_element(:darkness), do: encode_int(4)

  def encode_class(:adventurer), do: encode_int(0)
  def encode_class(:sorcerer), do: encode_int(1)
  def encode_class(:archer), do: encode_int(2)
  def encode_class(:swordsman), do: encode_int(3)
  def encode_class(:martial_artist), do: encode_int(4)

  def encode_equipments(equipment) do
    encode_struct([
      Map.get(equipment.hat, :id, -1) |> encode_int(),
      Map.get(equipment.armor, :id, -1) |> encode_int(),
      Map.get(equipment.weapon_skin, :id, -1) |> encode_int(),
      Map.get(equipment.main_weapon, :id, -1) |> encode_int(),
      Map.get(equipment.secondary_weapon, :id, -1) |> encode_int(),
      Map.get(equipment.mask, :id, -1) |> encode_int(),
      Map.get(equipment.fairy, :id, -1) |> encode_int(),
      Map.get(equipment.costume_suit, :id, -1) |> encode_int(),
      Map.get(equipment.costume_hat, :id, -1) |> encode_int()
    ])
  end

  def encode_mv(mv) do
    encode_list([
      encode_type(mv.entity_type),
      encode_int(mv.entity.id),
      encode_int(mv.position.coordinate_x),
      encode_int(mv.position.coordinate_y),
      encode_int(mv.speed)
    ])
  end
end
