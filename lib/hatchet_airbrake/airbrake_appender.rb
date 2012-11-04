require 'airbrake'
    
module Hatchet
  class AirbrakeAppender
    include LevelManager

    # Public: The name to post the messages as (default: Hatchet).
    #
    attr_accessor :name

    # Public: The project's Airbrake API key
    #
    attr_accessor :api_key

    # Public: The formatter used to format messages before sending them to Airbrake
    #
    attr_accessor :formatter

    # Public: Creates a new instance.
    #
    # By default the appender is created with a SimpleFormatter.
    #
    # block  - Optional block that can be used to customize the appender. The
    #          appender itself is passed to the block.
    #
    def initialize
      @name = 'Hatchet-Airbrake'
      @formatter = SimpleFormatter.new
      yield self if block_given?
    end

    # Internal: Sends an error to Airbrake.
    #
    # level   - The level of the message.
    # context - The context of the message.
    # message - The unformatted message.
    #
    # Returns nothing.
    #
    def add(level, context, message)
      if message.error
        opts = {
          :api_key => api_key,
          :error_message => @formatter.format(level, context, message),
          :backtrace => message.error.backtrace
        }
        ::Airbrake.notify message.error, opts
      end
    end

  end
end