defprotocol ProtocolFacade do
  @fallback_to_any true
  def start_server(data \\ nil)

  @fallback_to_any true
  def stop_server(data \\ nil)
end

defimpl ProtocolFacade, for: Any do
  def start_server(data) do
    {:ok, schedule_pid} = ScheduleServer.start_link(data)
    ScheduleServer.write_value(schedule_pid, "Config")
    ScheduleServer.read_system(schedule_pid)
  end

  def stop_server(data) do
    {:ok, schedule_pid} = ScheduleServer.start_link(data)
    ScheduleServer.destroy(schedule_pid, "Destroying")
    config = ScheduleServer.read_system(schedule_pid)
    ScheduleServer.shut_down(schedule_pid, config <> " and Shut Down...")
    ScheduleServer.read_system(schedule_pid)
  end
end


#ejecucion
# schedule = %ScheduleServer{}
# ProtocolFacade.start_server(schedule)
# ProtocolFacade.stop_server(schedule)
