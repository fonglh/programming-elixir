defmodule Chop do
  def guess(actual, low..high) do
    IO.puts "Is it #{div(low+high, 2)}?"
    current_guess(div((low+high), 2), actual, low..high)
  end

  defp current_guess(current, actual, _low.._high) when current == actual do
    IO.puts actual
  end

  defp current_guess(current, actual, _low..high) when current < actual do
    next_guess = div(current + 1 + high, 2)
    IO.puts "Is it #{next_guess}?"
    current_guess(next_guess, actual, (current+1)..high)
  end

  defp current_guess(current, actual, low.._high) when current > actual do
    next_guess = div(low + current - 1, 2)
    IO.puts "Is it #{next_guess}?"
    current_guess(next_guess, actual, low..(current-1))
  end
end
