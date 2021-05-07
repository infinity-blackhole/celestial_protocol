defmodule CelestialProtocol.Encoder.Gateway do
  import CelestialProtocol.Encoder.Helpers

  @portal_terminator "-1:-1:-1:10000.10000.1"

  def encode_nstest(%{username: username} = nstest) do
    encode_list([
      encode_int(nstest.key),
      encode_string(username),
      nstest.portals
      |> Enum.map(&encode_portal/1)
      |> encode_list(@portal_terminator)
    ])
  end

  def encode_nstest(nstest) do
    encode_list([
      encode_int(nstest.id),
      nstest.portals
      |> Enum.map(&encode_portal/1)
      |> encode_list(@portal_terminator)
    ])
  end

  def encode_portal(portal) do
    encode_tuple([
      encode_ip_address(portal.hostname),
      encode_int(portal.port),
      encode_int(portal_color(portal.population, portal.capacity)),
      encode_struct([
        encode_int(portal.id),
        encode_string(portal.channel_id),
        encode_int(portal.world_name)
      ])
    ])
  end

  defp portal_color(population, capacity) do
    round(population / capacity * 20) + 1
  end

  def encode_ip_address({d1, d2, d3, d4}) do
    encode_struct([
      encode_int(d1),
      encode_int(d2),
      encode_int(d3),
      encode_int(d4)
    ])
  end
end
