# Stream wrapper functions

# Stream.cycle
Stream.cycle(~w{ green white }) |>
Stream.zip(1..5) |>
Enum.map(fn { class, value } ->
         ~s{<tr class="#{class}"><td>#{value}</td></tr>\n} end) |>
IO.puts


# Stream.repeatedly
# prints [true, true, true]
IO.inspect Stream.repeatedly(fn -> true end) |> Enum.take(3)

# 3 random numbers
IO.inspect Stream.repeatedly(&:random.uniform/0) |> Enum.take(3)


# Stream.iterate generates an infinite stream
# Start at +start_value+ then generate the next one by applying +next_fun+
IO.inspect Stream.iterate(0, &(&1 + 1)) |> Enum.take(5)
IO.inspect Stream.iterate(2, &(&1 * &1)) |> Enum.take(5)
IO.inspect Stream.iterate([], &[&1]) |> Enum.take(5)

# Stream.unfold is like Stream.iterate, but with the ability to pass
# it the new state which will then be applied to the next function
# The generator function is of the form fn state -> { stream_value, new_state } end
Stream.unfold({0, 1}, fn {f1,f2} -> {f1, {f2, f1+f2}} end) |> Enum.take(15)
|> IO.inspect
