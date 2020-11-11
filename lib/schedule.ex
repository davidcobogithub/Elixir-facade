defmodule ScheduleServer do
  use GenServer

  @name ScheduleServer

  defstruct [:state]

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value ,name: @name)
  end

  def init(value) do
    {:ok, value}
  end

  def read_system() do
    GenServer.call(@name, :read_system)
  end

  def turn_on(value) do
    GenServer.call(@name, {:turn_on, value})
  end

  def shut_down(value) do
    GenServer.call(@name, {:shut_down, value})
  end

  def handle_call(:read_system, _from, value) do
    {:reply, value, value}
  end

  def handle_call({:turn_on, value}, _from, _) do
    {:reply, :ok, value}
  end

  def handle_call({:shut_down, value}, _from, _) do
    {:reply, :ok, value}
  end
end
