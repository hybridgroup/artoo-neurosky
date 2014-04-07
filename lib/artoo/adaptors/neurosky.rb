require 'artoo/adaptors/adaptor'

module Artoo
  module Adaptors
    # Connect to a neurosky device
    # @see device documentation for more information
    class Neurosky < Adaptor
      attr_reader :neurosky

      # Number of retries when connecting
      RETRY_COUNT = 5

      # Creates a connection with device
      # @return [Boolean]
      def connect
        @retries_left = RETRY_COUNT
        require 'mindset' unless defined?(::Mindset)
        begin
          @neurosky = ::Mindset.connect(connect_to)
          super
          return true
        rescue Errno::EBUSY, Errno::ECONNREFUSED => e
          @retries_left -= 1
          if @retries_left > 0
            retry
          else
            Logger.error e.message
            Logger.error e.backtrace.inspect
            return false
          end
        end
      end

      # Closes connection with device
      # @return [Boolean]
      def disconnect
        neurosky.disconnect if connected?
      end

      # Name of device
      # @return [String]
      def name
        "neurosky"
      end

      # Version of device
      # @return [String]
      def version
        Artoo::Neurosky::VERSION
      end

      # Uses method missing to call device actions
      # @see device documentation
      def method_missing(method_name, *arguments, &block)
        neurosky.send(method_name, *arguments, &block)
      end
    end
  end
end
