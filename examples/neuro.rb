require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/rfcomm0'
device :neurosky, :driver => :neurosky, :interval => 0.5
  
work do
  puts "Scanning..."
end
