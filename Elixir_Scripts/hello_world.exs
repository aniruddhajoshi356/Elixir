defmodule HelloWorld do
  def greet() do
    IO.puts("Hello, World!")
  end
  def greet2(name) do
    IO.puts("Hello, #{name}!")
  end
end

HelloWorld.greet()
HelloWorld.greet2("Aniruddha")
