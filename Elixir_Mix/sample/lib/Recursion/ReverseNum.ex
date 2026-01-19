defmodule Sample.Recursion.ReverseNum do
  def reverse(nun,acc\\0) #default argument
  def reverse(0, acc), do: acc
  def reverse(num, acc) do
    new_num=div(num,10)
    new_acc=acc*10 + rem(num,10)
    reverse(new_num,new_acc)
  end
end
