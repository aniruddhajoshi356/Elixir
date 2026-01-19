defmodule Streams.File do
  def print_file(file_path) do
    File.stream!(file_path)
    |> Stream.map(&(String.replace(&1, "\n", "")))
    |> Enum.each(&Streams.File.print_line/1)
  end
  def print_line(line) do
    line
     |> String.split("")
     |> Enum.each(&Streams.File.print_character/1)

    IO.puts(" ")
    :timer.sleep(500)
  end

  def print_character(char) do
    IO.write(char)
    :timer.sleep(100)
  end
end

Streams.File.print_file "Sample_text.txt"
