defmodule CelestialProtocol.Encoder do
  import CelestialProtocol.Encoder.{
    Client,
    Lobby,
    Gateway,
    Entity,
    Helpers
  }

  def encode(["in", payload]) do
    encode_list(["in", encode_in(payload)])
  end

  def encode(["clist_start", payload]) do
    encode_list(["clist_start", encode_clist_start(payload)])
  end

  def encode(["clist_end", _]) do
    encode_list(["clist_end"])
  end

  def encode(["clist", payload]) do
    encode_list(["clist", encode_clist(payload)])
  end

  def encode(["c_info", payload]) do
    encode_list(["c_info", encode_c_info(payload)])
  end

  def encode(["failc", payload]) do
    encode_list(["failc", encode_failc(payload)])
  end

  def encode(["fd", payload]) do
    encode_list(["fd", encode_fd(payload)])
  end

  def encode(["tit", payload]) do
    encode_list(["tit", encode_tit(payload)])
  end

  def encode(["lev", payload]) do
    encode_list(["lev", encode_lev(payload)])
  end

  def encode(["NsTeST", payload]) do
    encode_list(["NsTeST", encode_nstest(payload)])
  end

  def encode(["at", payload]) do
    encode_list(["at", encode_at(payload)])
  end

  def encode(["mv", payload]) do
    encode_list(["mv", encode_mv(payload)])
  end
end
