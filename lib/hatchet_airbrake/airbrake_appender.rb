require 'airbrake'
    
module Hatchet
  class AirbrakeAppender

    attr_accessor :api_key

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
          :error_message => message.to_s,
          :backtrace => message.error.backtrace
        }
        Airbrake.notify message.error, opts
      end
    end

  end
end