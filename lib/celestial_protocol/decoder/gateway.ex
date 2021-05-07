defmodule CelestialProtocol.Decoder.Gateway do
  import NimbleParsec
  import CelestialProtocol.Decoder.Helpers

  def nos0575(combinator \\ empty()) do
    combinator
    |> field(event("nos0575"), :event)
    |> ignore(separator())
    |> choice([
      nos0575_1(),
      nos0575_2(),
      nos0575_3()
    ])
  end

  def nos0575_1(combinator \\ empty()) do
    combinator
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum(), :username)
    |> ignore(separator())
    |> field(
      alphanum()
      |> map({:crypto, :hash, [:sha512]})
      |> map({:decrypt_password, []}),
      :hashed_password
    )
    |> ignore(separator())
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum() |> map({:normalize_version, []}), :version)
  end

  def nos0575_2(combinator \\ empty()) do
    combinator
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum(), :username)
    |> ignore(separator())
    |> field(alphanum(), :hashed_password)
    |> ignore(separator())
    |> ignore(alphanum())
    |> ignore(separator())
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum() |> map({:normalize_version, []}), :version)
    |> ignore(separator())
    |> field(alphanum(), :checksum)
  end

  def nos0575_3(combinator \\ empty()) do
    combinator
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum(), :username)
    |> ignore(separator())
    |> field(alphanum(), :hashed_password)
    |> ignore(separator())
    |> ignore(alphanum())
    |> ignore(separator())
    |> field(alphanum() |> map({:normalize_version, []}), :version)
    |> ignore(separator())
    |> field(alphanum(), :checksum)
  end

  @nostale_semver_regex ~r/(\d*)\.(\d*)\.(\d*)\.(\d*)/

  def normalize_version(version) do
    Regex.replace(@nostale_semver_regex, version, "\\1.\\2.\\3+\\4")
  end

  def decrypt_password(password) do
    password
    |> slice_password_padding()
    |> String.codepoints()
    |> Enum.take_every(2)
    |> Enum.chunk_every(2)
    |> Enum.map(&(&1 |> Enum.join() |> String.to_integer(16)))
    |> to_string()
  end

  defp slice_password_padding(password) do
    case password |> String.length() |> rem(2) do
      0 -> String.slice(password, 3..-1)
      1 -> String.slice(password, 4..-1)
    end
  end
end
