defmodule CelestialProtocol do
  def decode(payload) do
    case CelestialProtocol.Decoder.decode(payload) do
      {:ok, acc, _, _, _, _} ->
        {:ok, Map.new(acc)}

      {:error, _, _, _, _, _} ->
        :error
    end
  end

  def encode(payload) do
    CelestialProtocol.Encoder.encode(payload)
  end
end
