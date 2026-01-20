defmodule Messages do
  def work() do
    receive do
      {pid, {a, b}} ->
        send(pid, a * b)
    end
  end

  def run({a, b}) do
    spawn(fn -> work() end)
     |> send({self(), {a,b}})
    receive do result -> IO.puts("The result is #{result}") end
  end
end
Messages.run({5,6})
