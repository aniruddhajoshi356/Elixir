defmodule Sample.Structs.SevenWonders do
  defstruct name: " ", country: " "
  alias Sample.Structs.SevenWonders

  @type t :: %SevenWonders{
          name: String.t(),
          country: String.t()
  }

  @spec all() :: [t()]
  def all() do
    [
      %SevenWonders{name: "Great Wall of China", country: "China"},
      %SevenWonders{name: "Petra", country: "Jordan"},
      %SevenWonders{name: "Christ the Redeemer", country: "Brazil"},
      %SevenWonders{name: "Machu Picchu", country: "Peru"},
      %SevenWonders{name: "Chichen Itza", country: "Mexico"},
      %SevenWonders{name: "Roman Colosseum", country: "Italy"},
      %SevenWonders{name: "Taj Mahal", country: "India"}
    ]
  end

  @spec print_names([t()]) :: :ok
  def print_names(wonders) do
    Enum.each(wonders, fn %{name: name} -> IO.puts(name) end)
  end

  @spec filter_by_country([t()], String.t()) :: [t()]
  def filter_by_country(wonders, country) do
    Enum.filter(wonders, fn %{country: c} -> c==country end)
  end
  @spec in_countries_starting_with_i([t()]) :: [t()]
  def in_countries_starting_with_i(wonders) do
    Enum.filter(wonders, fn %{country: c} -> String.starts_with?(c, "I") end)
  end

  @spec sort_by_country_length([t()]) :: [t()]
  def sort_by_country_length(wonders) do
    Enum.sort(wonders, fn x,y -> String.length(x.country) < String.length(y.country) end)
  end

  @spec name_country_list([t()]) :: [[String.t()]]
  def name_country_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc -> [[wonder.name, wonder.country] | acc] end )
  end

  @spec name_country_keyword_list([t()]) :: [{atom(), String.t()}]

  def name_country_keyword_list(wonders) do
    Enum.reduce(wonders, [], fn wonder, acc -> [{String.to_atom(wonder.name), wonder.country} | acc] end )
  end
end
