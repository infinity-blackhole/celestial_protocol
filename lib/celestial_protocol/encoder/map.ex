defmodule CelestialProtocol.Encoder.Map do
  import CelestialProtocol.Encoder.Helpers

  def encode_direction(:north), do: encode_int(1)
  def encode_direction(:east), do: encode_int(2)
  def encode_direction(:south), do: encode_int(3)
  def encode_direction(:west), do: encode_int(4)
  def encode_direction(:north_east), do: encode_int(5)
  def encode_direction(:south_east), do: encode_int(6)
  def encode_direction(:south_west), do: encode_int(7)
  def encode_direction(:north_west), do: encode_int(8)
end
