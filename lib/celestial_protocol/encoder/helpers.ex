defmodule CelestialProtocol.Encoder.Helpers do
  def encode_list(list, terminator) do
    [terminator]
    |> Enum.concat(Enum.reverse(list))
    |> Enum.reverse()
    |> encode_list()
  end

  def encode_list(list) do
    Enum.intersperse(list, " ")
  end

  def encode_tuple(tuple) do
    Enum.intersperse(tuple, ":")
  end

  def encode_struct(struct) do
    Enum.intersperse(struct, ".")
  end

  def encode_int(number), do: number |> to_string

  def encode_string(""), do: "-"
  def encode_string(str), do: str

  def encode_bool(true), do: encode_int(1)
  def encode_bool(false), do: encode_int(0)
end
