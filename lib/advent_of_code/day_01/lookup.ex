defmodule AdventOfCode.Day01.Lookup do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def init(_) do
    :ets.new(
      __MODULE__,
      [:named_table, :public, write_concurrency: true]
    )

    {:ok, nil}
  end

  def put(value) do
    :ets.insert(__MODULE__, {value, true})
  end

  def has_value?(value) do
    case :ets.lookup(__MODULE__, value) do
      [{^value, _}] -> true
      _ -> false
    end
  end
end
