defmodule MyList do
  def len([]), do: 0
  def len([ _head | tail ]), do: 1 + len(tail)

  def square([]), do: []
  def square([ head | tail ]), do: [ head*head | square(tail) ]

  def map([], _func), do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  # this is actually one of the exercises, writing sum without an accumulator
  def sum([]), do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  # version from the book, using an accumulator
  def sum_orig(list), do: _sum_orig(list, 0)

  # the version from the book, with a parameter to track the partial sums
  # turn them into private helper functions, public API doesn't take the 0
  defp _sum_orig([], total), do: total
  defp _sum_orig([ head | tail ], total), do: _sum_orig(tail, head+total)

  # example use
  # MyList.reduce([1,2,3,4,5], 1, &(&1*&2))
  # MyList.reduce([1,2,3,4,5], 0, &(&1+&2))
  def reduce([], value, _) do
    value
  end

  def reduce([ head | tail ], value, func) do
    reduce(tail, func.(head, value), func)
  end
end
