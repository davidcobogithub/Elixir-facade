defmodule ScheduleServer do
  use GenServer

  defstruct [:state]

  def start_link(initial_value) do
    GenServer.start_link(__MODULE__, initial_value)
  end

  def init(value) do
    {:ok, value}
  end

  def read_system(pid) do
    GenServer.call(pid, :read_system)
  end

  def write_value(pid, new_value) do
    GenServer.call(pid, {:write_value, new_value})
  end

  def destroy(pid, new_value) do
    GenServer.call(pid, {:destroy, new_value})
  end

  def shut_down(pid, new_value) do
    GenServer.call(pid, {:shut_down, new_value})
  end

  def handle_call(:read_system, _from, value) do
    {:reply, value, value}
  end

  def handle_call({:write_value, new_value}, _from, _) do
    {:reply, :ok, new_value}
  end

  def handle_call({:destroy, new_value}, _from, _) do
    {:reply, :ok, new_value}
  end

  def handle_call({:shut_down, new_value}, _from, _) do
    {:reply, :ok, new_value}
  end
end
