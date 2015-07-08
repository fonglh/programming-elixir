defmodule Chap11 do
  # return true if a single quoted string contains only printable
  # ASCII characters (space through tilde, 32 through 126)
  def printable?([]), do: true
  def printable?([ head | tail ]) when head >= 32 and head <=126 do
    true && printable?(tail)
  end
  def printable?(_str), do: false

  # return true if parameters are anagrams
  def anagram?(word1, word2), do: word1 == Enum.reverse(word2)

  # write a function that takes a single quoted string of the form
  # number[+-*/]number and returns the result of the calculation
  def calculate(str) do
    {num1, remainder} = _get_num1(str, 0)
    _op(remainder, num1)
  end

  # return the 1st number, and the rest of the string in a tuple
  defp _get_num1([ head | tail ], num1) when head in '0123456789' do
    _get_num1(tail, num1*10 + head-?0)  
  end
  defp _get_num1(tail, num1), do: {num1, tail}

  defp _op([ ?+ | tail ], num1), do: num1 + _number_digits(tail, 0)
  defp _op([ ?- | tail ], num1), do: num1 - _number_digits(tail, 0)
  defp _op([ ?* | tail ], num1), do: num1 * _number_digits(tail, 0)
  defp _op([ ?/ | tail ], num1), do: num1 / _number_digits(tail, 0)
  
  # convert a number string to a number
  defp _number_digits([], value), do: value 
  defp _number_digits([ head | tail ], value), do: _number_digits(tail, value*10 + head-?0)
end

