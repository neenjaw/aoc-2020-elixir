defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  @tag :skip
  test "part1" do
    # """
    # 1-3 a: abcde
    # 1-3 b: cdefg
    # 2-9 c: ccccccccc
    # """
    input =
      File.read!("./data/day02/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, [" ", "-", ":"], trim: true))

    result = part1(input) |> IO.inspect(label: "17")

    assert result
  end

  # @tag :skip
  test "part2" do
    input =
      File.read!("./data/day02/input.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(&String.split(&1, [" ", "-", ":"], trim: true))

    result = part2(input) |> IO.inspect(label: "19")

    assert result
  end
end
