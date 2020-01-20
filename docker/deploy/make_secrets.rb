#!/usr/bin/env ruby

require 'base64'

namespace = ARGV[0]
filename = "#{namespace}.env"

if !File.exists?(filename)
  raise "You must have <namespace>.env file"
end

print(<<EOS)
apiVersion: v1
kind: Secret
metadata:
  name: #{namespace}-env
data:
EOS

File.open(filename) do |f|
  f.each_line do |line|
    if delimit_offset = line.index('=')
      key = line[0..delimit_offset-1]
      val = line[delimit_offset+1..-1].chomp

      if val[0] == "'" && val[-1] == "'"
        val = val[1..-2]
      end

      encoded_val = Base64.strict_encode64(val)

      if encoded_val != ''
        puts "  #{key}: #{encoded_val}"
      end
    end
  end
end
