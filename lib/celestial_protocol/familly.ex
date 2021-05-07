defmodule CelestialProtocol.Familly do
  import NimbleParsec
  import CelestialProtocol.Helpers
  import CelestialProtocol.Inventory

  def glmk(combinator \\ empty()) do
    combinator
    |> field(event("glmk"), :event)
    |> ignore(separator())
    |> field(alphanum(), :name)
  end

  def f_deposit(combinator \\ empty()) do
    combinator
    |> field(event("f_deposit"), :event)
    |> ignore(separator())
    |> field(inventory_type(), :inventory_type)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(index(), :new_slot)
  end

  def f_repos(combinator \\ empty()) do
    combinator
    |> field(event("f_repos"), :event)
    |> ignore(separator())
    |> field(index(), :slot)
    |> ignore(separator())
    |> field(quantity(), :amount)
    |> ignore(separator())
    |> field(index(), :new_slot)
  end

  def chat(combinator \\ empty()) do
    combinator
    |> field(event("chat"), :event)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end

  def glrm(combinator \\ empty()) do
    combinator
    |> field(event("glrm"), :event)
    |> ignore(separator())
    |> field(alphanum(), :message)
  end

  def f_auth(combinator \\ empty()) do
    combinator
    |> field(event("f_auth"), :event)
    |> ignore(separator())
    |> field(member_type(), :member_type)
    |> ignore(separator())
    |> field(id(), :authority_id)
    |> ignore(separator())
    |> field(quantity(), :value)
  end

  def member_type(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(:head),
      string("1") |> replace(:assistant),
      string("2") |> replace(:manager),
      string("3") |> replace(:member)
    ])
  end

  def fhis_cts(combinator \\ empty()) do
    combinator
    |> field(event("fhis_cts"), :event)
  end

  def frank_cts(combinator \\ empty()) do
    combinator
    |> field(event("frank_cts"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
  end

  def glist(combinator \\ empty()) do
    combinator
    |> field(event("glist"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
  end

  def gjoin(combinator \\ empty()) do
    combinator
    |> field(event("gjoin"), :event)
    |> ignore(separator())
    |> field(integer(min: 1), :type)
  end
end
