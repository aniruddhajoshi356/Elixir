defmodule Stats do
  alias Stats.CentralTendency.Mode
  alias Stats.CentralTendency.Median
  alias Stats.CentralTendency.Mean

  defdelegate population_mean(nums), to: Mean
  defdelegate median(list), to: Median
  defdelegate mode(list), to: Mode
end
