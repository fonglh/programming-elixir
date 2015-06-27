list_concat = fn list1, list2 -> list1 ++ list2 end
sum = fn num1, num2, num3 -> num1 + num2 + num3 end
pair_tuple_to_list = fn { elem1, elem2 } -> [ elem1, elem2 ] end

list_concat.([:a, :b], [:c, :d]) #=> [:a, :b, :c, :d]
sum.(1,2,3) #=> 6
pair_tuple_to_list.( { 1234, 5678 } ) #=> [1234,5678]
