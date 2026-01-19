defmodule Stats.CentralTendency.Mode do
  alias Stats.Errors
  alias Stats.Validators

  def mode(list) when is_list(list) do
    list |> Validators.validate_num_list() |> calculate_mode()
  end

  defp calculate_mode({:error, _msg}), do: Errors.invalid_data_type()
  defp calculate_mode({false, _list}), do: Errors.invalid_data_type()
  defp calculate_mode({true, list}) do
    ranked_map = Enum.frequencies(list)
    ranked_map
    |> Map.values()
    |> Enum.max()
    |> calc_mode(ranked_map)
  end

  defp calc_mode(1, _ranked_map), do: Errors.invalid_data_type()
  defp calc_mode(max, ranked_map) do
    ranked_map
    |> Map.filter(fn {_key, val} -> val == max end)
    |> Map.keys()
  end
end
