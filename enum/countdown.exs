# Stream.resource is like Stream.unfold, but with some changes that allow it
# to work with external resources.

defmodule Countdown do

  def sleep(seconds) do
    receive do
    after seconds*1000 -> nil
    end
  end

  def say(text) do
    spawn fn -> :os.cmd('say #{text}') end
  end

  def timer do
    Stream.resource(
      fn ->             # the number of seconds to the start of the next minute
        {_h, _m, s} = :erlang.time
        60 - s - 1
      end,

      fn                # wait for the next second, then return its countdown
        0 ->
          {:halt, 0}

        count ->
          sleep(1)
          { [inspect(count)], count - 1 }
      end,

      fn _ -> end       # nothing to deallocate
    )
  end
end

# iex(2)> printer = counter |> Stream.each(&IO.puts/1)
# #Stream<[enum: #Function<40.72687021/2 in Stream.resource/3>,
#  funs: [#Function<3.72687021/1 in Stream.each/2>]]>
# iex(3)> speaker = printer |> Stream.each(&Countdown.say/1)
# #Stream<[enum: #Function<40.72687021/2 in Stream.resource/3>,
#  funs: [#Function<3.72687021/1 in Stream.each/2>,
#   #Function<3.72687021/1 in Stream.each/2>]]>
# iex(4)> speaker |> Enum.take(5)
# 37
# 36
# 35
# 34
# 33
# ["37", "36", "35", "34", "33"]
# iex(5)> speaker |> Enum.take(5)
# 2
# 1
# ["2", "1"]
# iex(6)> speaker |> Enum.take(5)
# 58
# 57
# 56
# 55
# 54
# ["58", "57", "56", "55", "54"]
# iex(7)> speaker |> Enum.take(5)
# 27
# 26
# 25
# 24
# 23
# ["27", "26", "25", "24", "23"]
# 
