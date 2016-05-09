defmodule OnParle do

  @replace_rule ~r/[^A-Z]/

  @doc """
  This is the implementation of the metaphone algorithm, receiving a word
  and returning a representation of the word on plain English

  more about metaphone: https://en.wikipedia.org/wiki/Metaphone
  """
  @spec metaphone(String.t) :: String.t
  def metaphone word do
    word
      |> String.upcase()
      |> String.replace(@replace_rule, "")
      |> metaphone_apply_rules()
  end

  @metaphone_rules [
    [~r/([BCDFHJKLMNPQRSTVWXYZ])\1+/, "\\1"],
    [~r/^AE/, "E"],
    [~r/^[GKP]N/, "N"],
    [~r/^WR/, "R"],
    [~r/^X/, "S"],
    [~r/^WH/, "W"],
    [~r/MB$/, "M"],
    [~r/(?!^)SCH/, "SK"],
    [~r/TH/, "0"],
    [~r/T?CH|SH/, "X"],
    [~r/C(?=IA)/, "X"],
    [~r/[ST](?=I[AO])/, "X"],
    [~r/S?C(?=[IEY])/, "S"],
    [~r/[CQ]/, "K"],
    [~r/DG(?=[IEY])/, "J"],
    [~r/D/, "T"],
    [~r/G(?=H[^AEIOU])/, ""],
    [~r/GN(ED)?/, "N"],
    [~r/([^G]|^)G(?=[IEY])/, "\\1J"],
    [~r/G+/, "K"],
    [~r/PH/, "F"],
    [~r/([AEIOU])H(?=\b|[^AEIOU])/, "\\1"],
    [~r/[WY](?![AEIOU])/, ""],
    [~r/Z/, "S"],
    [~r/V/, "F"],
    [~r/(?!^)[AEIOU]+/, ""]
  ]
  defp metaphone_apply_rules word do
    Enum.reduce @metaphone_rules, word, fn rule, acc ->
      expression = Enum.at rule, 0
      replacement = Enum.at rule, 1
      String.replace acc, expression, replacement
    end
  end

end
