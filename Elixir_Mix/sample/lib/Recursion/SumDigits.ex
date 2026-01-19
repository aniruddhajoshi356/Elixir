defmodule Sample.Recursion.SumDigits do
  def sum(0), do: 0
  def sum(num) do
    num + sum(num-1) #this can be changed to tail recursion using the accumulator
  end
  #tail recursion using the accumulator
  def sum_accumulator(num, acc \\ 0) # default argument
  def sum_accumulator(0,acc), do: acc
  def sum_accumulator(num,acc) do
    sum_accumulator(num-1,acc+num)
  end
end
