# Nested Dictionaries, where values of keys are themselves dictionaries

defmodule Customer do
  defstruct name: "", company: ""
end

defmodule BugReport do
  defstruct owner: %{}, details: "", severity: 1
end

# report = %BugReport{owner: %Customer{name: "Dave", company: "Pragmatic"}, details: "Broken"}
# report.owner.company
# put_in(report.owner.company, "PragProg") # => macro to update nested dict value
# update_in function lets us apply a function to a value in a structure
