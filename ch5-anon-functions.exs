# Functions 1
list_concat = fn list1, list2 -> list1 ++ list2 end
sum = fn num1, num2, num3 -> num1 + num2 + num3 end
pair_tuple_to_list = fn { elem1, elem2 } -> [ elem1, elem2 ] end

list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
sum.(1,2,3) #=> 6
pair_tuple_to_list.( { 1234, 5678 } ) #=> [1234,5678]

# Functions 2 and 3
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

# Functions 4
# Create a function to add a prefix

prefix = fn pre -> (fn str -> pre <> " " <> str end) end

mrs = prefix.("Mrs")
IO.puts mrs.("Smith")

IO.puts prefix.("Elixir").("Rocks")

# Functions 5
# Rewrite with & notation
Enum.map [1,2,3,4], &(&1 + 2)
Enum.map [1,2,3,4], &(IO.inspect &1)
