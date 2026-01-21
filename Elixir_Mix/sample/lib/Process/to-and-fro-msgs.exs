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
  after
    500 -> IO.puts("No response received within timeout")
  end
end
Messages.run({5,6})
