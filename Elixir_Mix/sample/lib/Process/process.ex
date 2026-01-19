defmodule Process.Process do
  def work() do
    :timer.sleep 5000
    IO.puts "Work completed"
  end
  def run() do
    spawn fn -> work() end
  end
end

Process.Process.run()
IO.puts "This will print before work is completed"
