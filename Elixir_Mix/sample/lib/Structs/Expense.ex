defmodule Sample.Structs.Expense do
  alias Sample.Structs.Expense
  defstruct(
    title: " ",
    date: nil,
    amount: 0.0,
    store: " "
  )
  @type t :: %Expense{
    title: String.t(),
    date: Date.t() | nil,
    amount: number(),
    store: String.t()
  }

  @spec all_expenses() :: [t()]
  def all_expenses() do
    [
      %Expense{title: "Groceries", date: ~D[2024-01-15], amount: 150.75, store: "SuperMart"},
      %Expense{title: "Electricity Bill", date: ~D[2024-01-10], amount: 60.50, store: "PowerCo"},
      %Expense{title: "Dining Out", date: ~D[2024-01-12], amount: 45.00, store: "Foodies"},
      %Expense{title: "Gasoline", date: ~D[2024-01-14], amount: 30.25, store: "FuelStation"},
      %Expense{title: "Internet Bill", date: ~D[2024-01-11], amount: 55.00, store: "NetProvider"}
    ]
  end

  @spec total_expenses([t()]) :: number()
  def total_expenses(expenses) do
    expenses |> Enum.reduce(0, fn expense, acc -> expense.amount+acc end)
  end

  @spec sort_by_date([t()]) :: [t()]
  def sort_by_date(expenses) do
    Enum.sort_by(expenses, fn item -> item.date end)
  end

  @spec add_expense(t()) :: [t()]
  def add_expense(%Expense{} = expense) do
    [expense | all_expenses()]
  end

  @spec update_amount(String.t(), number()) :: [t()]
  def update_amount(title, amount) do
    #filter, create new expense with new amount, remove old one and add new new one
    [item] = Enum.filter(all_expenses(), fn %{title: t} -> t==title end)
    new_item = %Expense{item | amount: amount}
    [new_item | all_expenses() |> List.delete(item)]
  end
end
