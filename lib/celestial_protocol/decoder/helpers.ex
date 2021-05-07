defmodule CelestialProtocol.Decoder.Helpers do
  import NimbleParsec

  def id(combinator \\ empty()) do
    integer(combinator, min: 1)
  end

  def separator(combinator \\ empty()) do
    string(combinator, " ")
  end

  def bool(combinator \\ empty()) do
    choice(combinator, [
      string("0") |> replace(false),
      string("1") |> replace(true)
    ])
  end

  def alphanum(combinator \\ empty()) do
    ascii_string(combinator, [?a..?z, ?A..?Z, ?0..?9], min: 1)
  end

  def index(combinator \\ empty()) do
    integer(combinator, min: 1)
  end

  def quantity(combinator \\ empty()) do
    integer(combinator, min: 1)
  end

  def field(combinator \\ empty(), to_name, name) do
    unwrap_and_tag(combinator, to_name, name)
  end

  def repeated_field(combinator \\ empty(), to_name, name) do
    tag(repeat(combinator), to_name, name)
  end

  def event(combinator \\ empty(), name) do
    string(combinator, name)
  end

  def filter(combinator \\ empty()) do
    integer(combinator, min: 1)
  end
end
