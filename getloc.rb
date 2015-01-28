#!/usr/bin/ruby
require 'net/https'

mac = ARGV.first.delete(':').upcase

req_body = %{
<?xml version='1.0'?>
<LocationRQ xmlns='http://skyhookwireless.com/wps/2005' version='2.6' 
street-address-lookup='full'>
  <authentication version='2.0'>
    <simple>
      <username>beta</username>
      <realm>js.loki.com</realm>
    </simple>
  </authentication>
  <access-point>
    <mac>#{mac}</mac>
    <signal-strength>-50</signal-strength>
  </access-point>
</LocationRQ>
}.gsub(/^\s+|[\r\n]/, '')

http = Net::HTTP.new('api.skyhookwireless.com', 443)
http.use_ssl = true

http.start do |h|
  resp = h.post '/wps2/location', req_body, 'Content-Type' => 'text/xml'

  if resp.body =~ /<latitude>([^<]+).+<longitude>([^<]+)/
    puts "#$1, #$2"
  else
    puts "not found"
  end
end
