defmodule Chap11 do
  # return true if a single quoted string contains only printable
  # ASCII characters (space through tilde, 32 through 126)
  def printable?([]), do: true
  def printable?([ head | tail ]) when head >= 32 and head <=126 do
    true && printable?(tail)
  end
  def printable?(_str), do: false
end

