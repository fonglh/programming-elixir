# FizzBuzz with no conditiona logic

fizzbuzz = fn 0, 0, _ -> "FizzBuzz"
              0, _, _ -> "Fizz"
              _, 0, _ -> "Buzz"
              _, _, arg3 -> arg3
           end

run_fizzbuzz = fn num -> fizzbuzz.(rem(num, 3), rem(num, 5), num) end

IO.puts run_fizzbuzz.(10)
IO.puts run_fizzbuzz.(11)
IO.puts run_fizzbuzz.(12)
IO.puts run_fizzbuzz.(13)
IO.puts run_fizzbuzz.(14)
IO.puts run_fizzbuzz.(15)
IO.puts run_fizzbuzz.(16)
