defmodule CelestialProtocol do
  def decode(payload) do
    CelestialProtocol.Decoder.decode(payload)
  end
end
