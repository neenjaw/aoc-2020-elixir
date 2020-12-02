defmodule Mix.Tasks.D01.P2 do
  use Mix.Task

  import AdventOfCode.Day01

  @shortdoc "Day 01 Part 2"
  def run(args) do
    input =
      "./data/day01/part1-input.txt"
      |> File.stream!([], :line)
      |> Stream.map(fn x ->
        x |> String.trim() |> String.to_integer()
      end)
      |> Enum.to_list()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end
end
