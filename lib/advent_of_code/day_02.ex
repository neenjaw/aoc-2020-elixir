defmodule AdventOfCode.Day02 do
  def part1(passwords, count \\ 0)
  def part1([], count), do: count

  def part1([password | rem], count) do
    cond do
      valid_password?(password) -> part1(rem, count + 1)
      true -> part1(rem, count)
    end
  end

  def valid_password?(password, count \\ 0)

  def valid_password?([min, max, _letter, <<>>], count) do
    min = String.to_integer(min)
    max = String.to_integer(max)

    count >= min and count <= max
  end

  def valid_password?([min, max, <<c>> = letter, <<c, rest::binary>>], count) do
    valid_password?([min, max, letter, rest], count + 1)
  end

  def valid_password?([min, max, letter, <<_c, rest::binary>>], count) do
    valid_password?([min, max, letter, rest], count)
  end

  #
  #
  #

  def part2(passwords, count \\ 0)
  def part2([], count), do: count

  def part2([[a, b, letter, pw] | rem], count) do
    a = String.to_integer(a)
    b = String.to_integer(b)

    cond do
      p2_valid_password?(a, b, letter, pw) -> part2(rem, count + 1)
      true -> part2(rem, count)
    end
  end

  def p2_valid_password?(a, b, <<c>>, pw) do
    offset_a = a - 1
    offset_b = b - a - 1
    <<_::binary-size(offset_a), first, _::binary-size(offset_b), second, _::binary>> = pw

    (c === first or c === second) and first !== second
  end
end
