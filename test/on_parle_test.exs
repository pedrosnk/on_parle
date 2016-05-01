defmodule OnParleTest do
  use ExUnit.Case
  doctest OnParle

  test "Simple metaphone convention" do
    assert OnParle.metaphone("hello") == "HL"
    assert OnParle.metaphone("hypocrite") == "HPKRT"
    assert OnParle.metaphone("WELL") == "WL"
    assert OnParle.metaphone("am") == "AM"
    assert OnParle.metaphone("say") == "S"
  end

end
