defmodule ScheduleServerTest do
  use ExUnit.Case
  doctest ScheduleServer

  test "create schedule server" do
    schedule = %ScheduleServer{}
    {:ok, schedule_pid} = ScheduleServer.start_link(schedule.state)
    assert ScheduleServer.write_value(schedule_pid, "new value") == :ok
    assert ScheduleServer.read_system(schedule_pid) == "new value"
  end

  test "shut down schedule server" do
    schedule = %ScheduleServer{}
    {:ok, schedule_pid} = ScheduleServer.start_link(schedule.state)
    assert ScheduleServer.destroy(schedule_pid, "Destroying") == :ok
    assert ScheduleServer.read_system(schedule_pid) == "Destroying"
    assert ScheduleServer.shut_down(schedule_pid, "Shut Down...") == :ok
    assert ScheduleServer.read_system(schedule_pid) == "Shut Down..."
  end
end
