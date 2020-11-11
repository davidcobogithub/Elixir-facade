defmodule ProtocolFacadeTest do
  use ExUnit.Case
  doctest ProtocolFacade

  test "start server implementation" do
    schedule = %ScheduleServer{state: :true}
    assert ProtocolFacade.start_server(schedule) == schedule.state
  end

  test "stop server implementation" do
    schedule = %ScheduleServer{state: :false}
    assert ProtocolFacade.stop_server(schedule) == schedule.state
  end

  test "start schedule server for Any" do
    data = 3.0
    assert ProtocolFacade.start_server(data) == "Not implemented start_server for Any, data is #{data}"
  end

  test "stop schedule server for Any" do
    data = 3.0
    assert ProtocolFacade.stop_server(data) == "Not implemented stop_server for Any, data is #{data}"
  end

  test "start schedule server with value in false" do
    schedule = %ScheduleServer{state: :false}
    assert ProtocolFacade.start_server(schedule) ==  "For start state must be in true"
  end

  test "stop schedule server with value in true" do
    schedule = %ScheduleServer{state: :true}
    assert ProtocolFacade.stop_server(schedule) == "For stop state must be in false"
  end
end
