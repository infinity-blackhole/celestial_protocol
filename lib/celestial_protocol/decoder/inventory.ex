defmodule CelestialProtocol.Decoder.Inventory do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def b_i(combinator \\ empty()) do
    combinator
    |> field(event("b_i"), :event)
    |> ignore(separator())
    |> field(inventory_type(), :inventory_type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(integer(min: 1), :option)
  end

  def inventory_type(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:equipment),
      string("1") |> replace(:main),
      string("2") |> replace(:ttc),
      string("3") |> replace(:miniland),
      string("6") |> replace(:specialist),
      string("7") |> replace(:costume),
      string("8") |> replace(:wear),
      string("9") |> replace(:bazaar),
      string("10") |> replace(:warehouse),
      string("11") |> replace(:family_warehouse),
      string("12") |> replace(:pet_warehouse),
      string("13") |> replace(:first_partner_inventory),
      string("14") |> replace(:second_partner_inventory),
      string("15") |> replace(:third_partner_inventory)
    ])
  end

  def deposit(combinator \\ empty()) do
    combinator
    |> field(event("deposit"), :event)
    |> ignore(separator())
    |> field(inventory_type(), :inventory_type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(index(), :new_slot)
    |> ignore(separator())
    |> field(bool(), :partner_backpack?)
  end

  def eqinfo(combinator \\ empty()) do
    combinator
    |> field(event("eqinfo"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(optional(id()), :shop_owner_id)
  end

  def get(combinator \\ empty()) do
    combinator
    |> field(event("get"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :picker_type)
    |> ignore(separator())
    |> field(id(), :picker_id)
    |> ignore(separator())
    |> field(id(), :transport_id)
  end

  def mve(combinator \\ empty()) do
    combinator
    |> field(event("mve"), :event)
    |> ignore(separator())
    |> field(inventory_type(), :inventory_type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(index(), :destination_inventory_type)
    |> ignore(separator())
    |> field(index(), :destination_slot)
  end

  def mvi(combinator \\ empty()) do
    combinator
    |> field(event("mvi"), :event)
    |> ignore(separator())
    |> field(inventory_type(), :inventory_type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(index(), :destination_slot)
  end
end
