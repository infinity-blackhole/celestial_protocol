defmodule CelestialProtocol.Decoder.Bazaar do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def c_blist(combinator \\ empty()) do
    combinator
    |> field(event("c_blist"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(filter_type(), :subfilter_type)
    |> ignore(separator())
    |> field(filter(), :level_filter)
    |> ignore(separator())
    |> field(filter(), :rare_filter)
    |> ignore(separator())
    |> field(filter(), :upgrade_filter)
    |> ignore(separator())
    |> field(filter(), :order_filter)
    |> ignore(separator())
    |> field(filter(), :item_vnum_filter)
  end

  def filter_type(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:default),
      string("1") |> replace(:weapon),
      string("2") |> replace(:armor),
      string("3") |> replace(:equipment),
      string("4") |> replace(:jewelery),
      string("5") |> replace(:specialist),
      string("6") |> replace(:pet),
      string("7") |> replace(:npc),
      string("8") |> replace(:shell),
      string("9") |> replace(:main),
      string("10") |> replace(:usable),
      string("11") |> replace(:other),
      string("12") |> replace(:vehicle)
    ])
  end

  def c_buy(combinator \\ empty()) do
    combinator
    |> field(event("c_buy"), :event)
    |> ignore(separator())
    |> field(id(), :id)
    |> ignore(separator())
    |> field(index(), :vnum)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(quantity(), :price)
  end

  def c_reg(combinator \\ empty()) do
    combinator
    |> field(event("c_reg"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
    |> ignore(separator())
    |> field(integer(min: 1), :inventory)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :durability)
    |> ignore(separator())
    |> field(bool(), :package?)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(quantity(), :price)
    |> ignore(separator())
    |> field(quantity(), :taxe)
    |> ignore(separator())
    |> field(bool(), :medal_used?)
  end

  def c_scalc(combinator \\ empty()) do
    combinator
    |> field(event("c_scalc"), :event)
    |> ignore(separator())
    |> field(id(), :id)
    |> ignore(separator())
    |> field(index(), :vnum)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(quantity(), :max_amount)
    |> ignore(separator())
    |> field(quantity(), :price)
  end

  def c_skill(combinator \\ empty()) do
    field(combinator, event("c_skill"), :event)
  end

  def c_slist(combinator \\ empty()) do
    combinator
    |> field(event("c_slist"), :event)
    |> ignore(separator())
    |> field(index(), :index)
    |> ignore(separator())
    |> field(filter(), :filter)
  end

  def f_withdraw(combinator \\ empty()) do
    combinator
    |> field(event("f_withdraw"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
  end
end
