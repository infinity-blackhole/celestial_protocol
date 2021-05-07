defmodule CcelestialProtocolTest do
  use ExUnit.Case
  doctest CcelestialProtocol

  test "greets the world" do
    assert CcelestialProtocol.hello() == :world
  end
end
