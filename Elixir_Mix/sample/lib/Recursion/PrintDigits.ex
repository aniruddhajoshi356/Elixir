defmodule Sample.Recursion.PrintDigits do
  #base case
  def upto(0), do: IO.puts(0)
  def upto(num) do
    #Head Recursion
    upto(num-1)
    IO.puts(num)
  end
end
