defmodule AdventOfCode.Day01 do
  alias AdventOfCode.Day01.Lookup

  def part1(args, goal \\ 2020) do
    Lookup.start_link()

    x =
      args
      |> Enum.find(fn n ->
        case Lookup.has_value?(goal - n) do
          false ->
            Lookup.put(n)
            false

          true ->
            true
        end
      end)

    case x do
      nil ->
        nil

      _ ->
        (goal - x) * x
    end
  end

  def part2(values, goal \\ 2020)

  def part2([], _goal) do
    nil
  end

  def part2([value | remaining], goal) do
    case part1(remaining, goal - value) do
      nil -> part2(remaining, goal)
      x -> x * value
    end
  end
end
