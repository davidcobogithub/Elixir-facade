defprotocol ProtocolFacade do
  @fallback_to_any true
  def start_server(data \\ nil)

  @fallback_to_any true
  def stop_server(data \\ nil)
end

defimpl ProtocolFacade, for: ScheduleServer do
  def start_server(data) do

    if data.state == :true do
      ScheduleServer.start_link(data)
      ScheduleServer.turn_on(data.state)
      ScheduleServer.read_system()
    else
      "For start state must be in true"
    end
  end

  def stop_server(data) do

    if data.state == :false do
      ScheduleServer.start_link(data)
      ScheduleServer.shut_down(data.state)
      ScheduleServer.read_system()
    else
    "For stop state must be in false"
    end
  end
end

defimpl ProtocolFacade, for: Any do
  def start_server(data) do
   "Not implemented start_server for Any, data is #{data}"
  end

  def stop_server(data) do
 "Not implemented stop_server for Any, data is #{data}"
  end
end


#ejecucion
# schedule = %ScheduleServer{state: :true}
# schedule = %ScheduleServer{state: :false}
# ProtocolFacade.start_server(schedule)
# ProtocolFacade.stop_server(schedule)
