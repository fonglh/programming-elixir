import Enum

defmodule Card do
  def deck do
    for rank <- '23456789TJQK', suit <- 'CDHS', do: [suit, rank]
  end

  def hand do
    deck() |> shuffle |> take(13)
  end
end
