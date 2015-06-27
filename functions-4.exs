# Create a function to add a prefix

prefix = fn pre -> (fn str -> pre <> " " <> str end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")
