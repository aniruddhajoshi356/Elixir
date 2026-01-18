defmodule Sample.Lists do
  def sum_list_simple([]), do: 0
  def sum_list_simple([h|t]), do: h + sum_list_simple(t)

  def sum_tail_recursive(nums,acc \\ 0) # default argument
  def sum_tail_recursive([], acc), do: acc
  def sum_tail_recursive([h|t], acc), do: sum_tail_recursive(t, acc+h)
end
