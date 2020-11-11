defmodule ScheduleServerTest do
  use ExUnit.Case
  doctest ScheduleServer

  test "create schedule server" do
    schedule = %ScheduleServer{state: :true}
    ScheduleServer.start_link(schedule.state)
    assert ScheduleServer.turn_on(schedule.state) == :ok
    assert ScheduleServer.read_system() == schedule.state
  end

  test "shut down schedule server" do
    schedule = %ScheduleServer{state: :false}
    ScheduleServer.start_link(schedule.state)
    assert ScheduleServer.shut_down(schedule.state) == :ok
    assert ScheduleServer.read_system() == schedule.state
  end

end
