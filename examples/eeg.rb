require 'artoo'

connection :neurosky, :adaptor => :neurosky, :port => '/dev/rfcomm0'
device :neurosky, :driver => :neurosky, :interval => 0.1

def handle_eeg(sender, data)
  puts data
end

work do
  puts "Scanning..."
  on neurosky, :eeg => :handle_eeg
end
