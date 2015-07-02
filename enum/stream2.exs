# IO.stream converts the IO device (the open file) into
# a stream that serves one line at a time.
IO.puts File.open!("/usr/share/dict/words")
        |> IO.stream(:line)
        |> Enum.max_by(&String.length/1)

# there's a shortcut for the above
IO.puts File.stream!("/usr/share/dict/words") |> Enum.max_by(&String.length/1)
