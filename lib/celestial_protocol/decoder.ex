defmodule CelestialProtocol.Decoder do
  import NimbleParsec

  import CelestialProtocol.Decoder.{
    Helpers,
    Bazaar,
    Battle,
    Client,
    Economy,
    Familly,
    Game,
    Gateway,
    Group,
    Guri,
    Instances,
    Inventory,
    Lobby,
    Mall,
    Miniland,
    Network,
    Social
  }

  command =
    field(id(), :ref)
    |> ignore(separator())
    |> choice([
      c_blist(),
      c_buy(),
      c_reg(),
      c_scalc(),
      c_skill(),
      c_slist(),
      f_withdraw(),
      mtlist(),
      c_close(),
      gop(),
      f_stash_end(),
      lbs(),
      req_exc(),
      f_repos(),
      glmk(),
      f_deposit(),
      chat(),
      glrm(),
      f_auth(),
      fhis_cts(),
      frank_cts(),
      glist(),
      gjoin(),
      game_start(),
      nos0575(),
      guri(),
      say(),
      bsc(),
      instance_type(),
      espace(),
      git(),
      mkraid(),
      b_i(),
      deposit(),
      eqinfo(),
      get(),
      mve(),
      mvi(),
      char_new(),
      select(),
      char_del(),
      char_ren(),
      mall(),
      addobj(),
      mjoin(),
      mledit(),
      mg(),
      mz(),
      blins(),
      btk(),
      compl(),
      fdel(),
      fins(),
      pcl(),
      hero(),
      ncif(),
      npinfo()
    ])
    |> eos()

  handshake =
    field(id(), :ref)
    |> ignore(separator())
    |> field(alphanum(), :key)
    |> ignore(separator())
    |> field(id(), :ref)
    |> ignore(separator())
    |> field(alphanum(), :password)
    |> eos()

  heartbeat =
    field(id(), :ref)
    |> ignore(separator())
    |> field(integer(min: 1), :code)
    |> eos()

  packet =
    choice([
      command,
      handshake,
      heartbeat
    ])

  defparsec(:decode, packet)
end
