defmodule Demo do
  def work() do
    IO.puts "Doing something important..."
    exit :error
  end
  def run() do
    Process.flag :trap_exit, true
    spawn_link fn -> work() end
    receive do
      response -> IO.inspect response
    end

    IO.puts "After receiving exit signal"
  end
end
Demo.run()
