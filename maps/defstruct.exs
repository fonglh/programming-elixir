defmodule Subscriber do
  defstruct name: "", paid: false, over_18: true
end

# Create a struct by adding the module name between the % and the {
# %Subscriber{name: "Dave"}
# Update same as for map, pass the old one in first, update the values, a new map is returned.
# %Subscriber{ s1 | name: "Mary" }
