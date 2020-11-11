defmodule ProtocolFacadeTest do
  use ExUnit.Case
  doctest ProtocolFacade

  test "start server implementation" do
    schedule = %ScheduleServer{}
    assert ProtocolFacade.start_server(schedule.state) == "Config"
  end

  test "stop server implementation" do
    schedule = %ScheduleServer{}
    assert ProtocolFacade.stop_server(schedule.state) == "Destroying and Shut Down..."
  end
end
