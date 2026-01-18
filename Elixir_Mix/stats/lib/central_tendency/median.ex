defmodule Stats.CentralTendency.Median do
  require Integer
  alias Stats.Errors
  alias Stats.Validators

  @spec median([number()]) :: number() | {atom(), String.t()}
  def median(list) when is_list(list) do
    list |> Validators.validate_num_list() |> calculate_median()
  end

  @spec calculate_median({boolean(), [number()]}) :: number() | {atom(), String.t()}
  defp calculate_median({:error, _msg}), do: Errors.invalid_data_type()
  defp calculate_median({false, _list}), do: Errors.invalid_data_type()
  defp calculate_median({true, list}) do
    count = Enum.count(list)
    list |> Enum.sort |> find_median(Integer.is_even(count), count)
  end

  @spec find_median([number()], boolean(), integer()) :: number()
  defp find_median(sorted_list, false, count), do: Enum.at(sorted_list, div(count,2))
  defp find_median(sorted_list, true, count) do
    a = Enum.at(sorted_list, div(count-1,2))
    b = Enum.at(sorted_list, div(count,2))
    a+b/2
  end

end
