defmodule Process.Messages do
  def work() do
    receive do
      message ->
        :timer.sleep(5000)
        IO.puts(message)
    end
  end

  def run(message) do
    pid = spawn(fn -> work() end)
    send(pid, message)
  end
end
Process.Messages.run("Work completed")
