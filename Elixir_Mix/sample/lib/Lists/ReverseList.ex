defmodule Sample.Lists.ReverseList do
  @spec reverse_list(list(any()), [any()]) :: list(number())
  def reverse_list(list, acc \\ []) # default argument
  def reverse_list([],acc), do: acc
  def reverse_list([h|t],acc), do: reverse_list(t,[h|acc])

@spec map(list(any()), (any() -> any()), list(any())) :: list(any())
  def map(list, func, acc \\ []) # default argument
  def map([],_func, acc), do: acc |> reverse_list()
  def map([h|t], func, acc),do: map(t, func, [func.(h)|acc])
@spec auxfunc(list(any()), list(any())) :: list(any())
  def auxfunc(src, dest), do: concat(src|>reverse_list(),dest)
@spec concat(list(any()),list(any())) :: list(any())
  def concat([], dest), do: dest
  def concat([h|t], dest), do: concat(t, [h|dest])

end
