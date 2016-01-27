
sum =  fn a,b,c ->  a + b + c end
# sum =  &( &1 + &2 + &3)

IO.inspect sum.(1, 2, 3) #=> 6

pair_tuple_to_list =  fn {a, b} ->  [a, b] end

IO.inspect pair_tuple_to_list.( { 1234, 5678 } ) #=> [ 1234, 5678 ]