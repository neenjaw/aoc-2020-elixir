defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  # @tag :skip
  test "example" do
    input = [
      979,
      1721,
      366,
      299,
      675,
      1456
    ]

    assert 514_579 == part1(input)
  end

  test "part1" do
    value =
      "./data/day01/part1-input.txt"
      |> File.stream!([], :line)
      |> Stream.map(fn x ->
        x |> String.trim() |> String.to_integer()
      end)
      |> part1()

    assert value == 73371
  end

  # @tag :skip
  test "part2" do
    value =
      "./data/day01/part1-input.txt"
      |> File.stream!([], :line)
      |> Stream.map(fn x ->
        x |> String.trim() |> String.to_integer()
      end)
      |> Enum.to_list()
      |> part2()

    assert value == 127_642_310
  end
end
