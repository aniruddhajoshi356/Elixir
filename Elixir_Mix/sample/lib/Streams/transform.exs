defmodule Sample.Streams do
    def transform(list) do
      list |> Enum.map(fn x -> x*2 end)
        |> Enum.drop_every(3)
        |> Enum.reduce(0, fn x, acc -> x+acc end)
    end


end
Sample.Streams.transform(1..5) |> IO.puts
