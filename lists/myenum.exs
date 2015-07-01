defmodule MyEnum do
  def all?(list, func), do: _all?(list, func, true)

  defp _all?([], _func, value), do: value
  defp _all?([ head | tail ], func, value), do: func.(head) and _all?(tail, func, value)

  def each([], _func), do: :ok
  def each([ head | tail ], func) do
    func.(head)
    each(tail, func)
  end
end
