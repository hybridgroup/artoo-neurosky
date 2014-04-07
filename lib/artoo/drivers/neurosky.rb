require 'artoo/drivers/driver'

module Artoo
  module Drivers
    # The neurosky driver behaviors
    class Neurosky < Driver

      # Start driver and any required connections
      def start_driver
        begin
          every(interval) do
            handle_message_events
          end

          super
        rescue Exception => e
          Logger.error "Error starting Neurosky driver!"
          Logger.error e.message
          Logger.error e.backtrace.inspect
        end
      end

      def handle_message_events
        begin
          while true do
            packets = connection.read_packet
            return if packets.empty?
            packets.each { |pkt|
              handle_packet(pkt)
            }
          end
        #rescue ::Mindset::Connection::TimeoutError, Interrupt => e
          #cont = false
        end
      end

      def handle_packet(packet)
        case
        when packet[:wave]
          publish(event_topic_name("wave"), packet[:wave]) 
        
        when packet[:signal_quality]
          publish(event_topic_name("signal_quality"), packet[:signal_quality])

        when packet[:attention]
          publish(event_topic_name("attention"), packet[:attention])

        when packet[:meditation]
          publish(event_topic_name("meditation"), packet[:meditation])

        when packet[:delta]
          publish(event_topic_name("eeg"), packet)

        else
          puts packet.inspect
        end
      end


{:signal_quality=>200}
{:delta=>7023617, :theta=>15294464, :lo_alpha=>15209472, :hi_alpha=>13321984, :lo_beta=>4527616, :hi_beta=>12073472, :lo_gamma=>862464, :mid_gamma=>13637632}
{:attention=>0}
{:meditation=>0}


    end
  end
end
