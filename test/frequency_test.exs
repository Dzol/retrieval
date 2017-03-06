defmodule FrequencyTest do
  use ExUnit.Case

  test "Frequency.term/1" do

    assert Retrieval.Frequency.term(pangram()) == f()
  end

  test "Frequency.term/2" do

    assert Retrieval.Frequency.frequency(f(), "the") == 2
  end

  test "Frequency.document/2" do

    assert Retrieval.Frequency.document(%{"f" => f()}, "fu") == 0
    assert Retrieval.Frequency.document(%{"f" => f()}, "the") == 2
    assert Retrieval.Frequency.document(%{"x" => f(), "y" => f()}, "the") == 4
  end

  defp pangram do
    ["the",
     "quick",
     "brown",
     "fox",
     "jumps",
     "over",
     "the",
     "lazy",
     "dog"]
  end

  defp f do
    %{"the"   => 2,
      "quick" => 1,
      "brown" => 1,
      "fox"   => 1,
      "jumps" => 1,
      "over"  => 1,
      "lazy"  => 1,
      "dog"   => 1}
  end
end
