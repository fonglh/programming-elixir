# When the accessor things (get_in, put_in, update_in, get_and_update_in)
# take a list of keys as a separate parameter, they become dynamic function calls

nested = %{
  buttercup: %{
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  westley: %{
    actor: %{
      first: "Carey",
      last: "Ewes"      # typo on purpose!
    },
    role: "farm boy"
  }
}


IO.inspect get_in(nested, [:buttercup])
IO.inspect get_in(nested, [:buttercup, :actor])
IO.inspect get_in(nested, [:buttercup, :actor, :first])

IO.inspect put_in(nested, [:westley, :actor, :last], "Elwes")

# get_in and get_and_update_in can take a function as a key
authors = [
  %{ name: "Jose", language: "Elixir" },
  %{ name: "Matz", language: "Ruby" },
  %{ name: "Larry", language: "Perl" }
]

languages_with_an_r = fn (:get, collection, next_fn) ->
  for row <- collection do
    if String.contains?(row.language, "r") do
      next_fn.(row)
    end
  end
end

IO.inspect get_in(authors, [languages_with_an_r, :name])

