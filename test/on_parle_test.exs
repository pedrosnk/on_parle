defmodule OnParleTest do
  use ExUnit.Case
  doctest OnParle

  test "Metaphone convention" do
    assert OnParle.metaphone("hello") == "HL"
    assert OnParle.metaphone("hypocrite") == "HPKRT"
    assert OnParle.metaphone("well") == "WL"
    assert OnParle.metaphone("am") == "AM"
    assert OnParle.metaphone("say") == "S"
  end

end
