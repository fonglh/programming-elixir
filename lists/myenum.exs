defmodule MyEnum do
  def all?(list, func), do: _all?(list, func, true)
  defp _all?([], _func, value), do: value
  defp _all?([ head | tail ], func, value), do: func.(head) and _all?(tail, func, value)

  def each([], _func), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end

  def filter(collection, func), do: _filter(collection, func, [])
  defp _filter([], _func, result), do: result 
  defp _filter([ head | tail ], func, result) do
    if func.(head) == true do
      _filter(tail, func, result ++ [head])
    else
      _filter(tail, func, result)
    end
  end

  def take(_collection, 0), do: []
  def take([ head | tail ], num_elements) do
    [head] ++ take(tail, num_elements-1)
  end

  def split(collection, num_elements), do: _split(collection, num_elements, [])
  defp _split(collection, 0, first_half), do: {first_half, collection}
  defp _split([ head | tail ], num_elements, first_half) do
    _split(tail, num_elements-1, first_half ++ [head])
  end
end

