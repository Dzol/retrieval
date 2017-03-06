defmodule Retrieval.Frequency do

  @spec frequency(table :: Map.t, term :: String.t) :: Integer.t
  def frequency(x, y) do
    Map.get(x, y, 0)
  end
  
  @spec term([terms :: String.t]) :: Map.t
  def term(x = [_|_]) do
    _term(x, &tally/1)
  end

  @spec document(%{required(String.t) => table :: Map.t}, term :: String.t) :: Integer.t
  def document(x, y) do
    case get_in(x, [&f/3, y]) do
      [nil] ->
        0
      z ->
        Enum.sum(z)
    end
  end

  ## Ancillary

  defp _term(x, f) do
    f.(x)
  end

  defp f(:get, m, g) do
    for {_, x} <- m, do: g.(x)
  end

  ## Raw Term Frequency

  defp tally(x) do
    tally(x, %{})
  end

  defp tally([], y) do
    y
  end
  defp tally([a|b], y) do
    tally(b, mark(y, a))
  end

  defp mark(y, a) do
    Map.update(y, a, 1, &increment/1)
  end

  defp increment(x) do
    x + 1
  end
end
