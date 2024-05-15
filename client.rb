#!/usr/bin/env ruby

# frozen_string_literal: true

# Bad, but proper setup will take much more time,
# so please bear with me
$LOAD_PATH << 'lib'

require 'silly_services_pb'

RED = "\e[31m"
RESET = "\e[m"

if ARGV.empty?
  puts "#{RED}ERROR: Duration in seconds required#{RESET}"
  exit
end

duration = ARGV[0].to_i

address = 'localhost:50051'
stub = Silly::Stub.new(address, :this_channel_is_insecure)
message = stub.sleep_for(SleepRequest.new(duration: duration)).message
puts "Response: #{message}"
