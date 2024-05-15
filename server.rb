#!/usr/bin/ruby

# frozen_string_literal: true

# Bad, but proper setup will take much more time,
# so please bear with me
$LOAD_PATH << 'lib'

require 'silly_services_pb'

class Server < Silly::Service
  # @param [SleepRequest] request
  def sleep_for(request, _call)
    sleep(request.duration)
    SleepResponse.new(message: "Slept for #{request.duration} seconds")
  end
end

GRPC::RpcServer.new.tap do |s|
  s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
  s.handle(Server)
  s.run_till_terminated_or_interrupted([1, 'int', 'SIGTERM'])
end
