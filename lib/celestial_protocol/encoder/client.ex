defmodule CelestialProtocol.Encoder.Client do
  import CelestialProtocol.Encoder.Helpers

  def encode_failc(failc) do
    encode_error(failc.error)
  end

  def encode_info(info) do
    encode_string(info.message)
  end

  def encode_error(:outdated_client), do: encode_int(1)
  def encode_error(:unexpected_error), do: encode_int(2)
  def encode_error(:maintenance), do: encode_int(3)
  def encode_error(:session_already_used), do: encode_int(4)
  def encode_error(:unvalid_credentials), do: encode_int(5)
  def encode_error(:cant_authenticate), do: encode_int(6)
  def encode_error(:citizen_blacklisted), do: encode_int(7)
  def encode_error(:country_blacklisted), do: encode_int(8)
  def encode_error(:bad_case), do: encode_int(9)
end
