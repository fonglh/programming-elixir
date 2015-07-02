# Enum is greedy. This generates 4 lists on the way to getting the final result
[1,2,3,4,5]
|> Enum.map(&(&1*&1))   # create a list of its squares
|> Enum.with_index      # create a list of tuples
|> Enum.map(fn {value, index} -> value - index end)   # subtract index from the value
|> IO.inspect
