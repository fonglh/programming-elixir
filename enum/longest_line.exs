# find the longest word in the dictionary
# but each step is processed in full before going on to the next
IO.puts File.read!("/usr/share/dict/words")
        |> String.split
        |> Enum.max_by(&String.length/1)
