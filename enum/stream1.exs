[1,2,3,4]
|> Stream.map(&(&1*&1)) # square
|> Stream.map(&(&1+1))  # plus one
|> Stream.filter(fn x -> rem(x, 2) == 1 end)  # odd numbers
|> Enum.to_list
|> IO.inspect

# here, we aren't creating intermediate lists.
# Just passing successive elements of each collection to the next in the chain.
