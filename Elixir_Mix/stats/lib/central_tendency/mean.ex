defmodule Stats.CentralTendency.Mean do

  alias Stats.Errors
  alias Stats.Validators
  @spec population_mean(list(number())) :: number() | {atom(), String.t()}
  def population_mean([]), do: Errors.invalid_data_type()
  def population_mean(nums) when is_list(nums) do
    nums |> Validators.validate_num_list()
    |> calculate_population_mean()
  end
  def population_mean(_), do: Errors.invalid_data_type()

  @spec calculate_population_mean({boolean(), [number()]}) :: number() | {atom(), String.t()}
  defp calculate_population_mean({false, _nums}), do: Errors.invalid_data_type()
  defp calculate_population_mean({true, nums}) do
    Enum.sum(nums) |> mean(Enum.count(nums))
  end

  @spec mean(number(), integer()) :: number()
  defp mean(sigma, total), do: sigma/total
end
