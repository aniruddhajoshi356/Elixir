defmodule Sample.Recursion.Factorial do
  def fact(1), do: 1
  def fact(num), do: num * fact(num-1) #it can be replaced with tail recursion using accumulator
  #tail recursion using accumulator
  def fact_accumulator(num, acc \\1) # Function definition withdefault argument
  def fact_accumulator(0, acc), do: acc
  def fact_accumulator(num, acc), do: fact_accumulator(num-1,acc*num)
end
