defmodule Streams.File do
  def print_file(file_path) do
    File.stream!(file_path)
    |> Stream.map(&(String.replace(&1, "\n", " ")))
    |> Enum.each(print_line/1)
  end
  def print_line(line) do
    line
     |> Enum.each(gi)
  end
end
