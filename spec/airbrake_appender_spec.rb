require_relative 'spec_helper'

describe "AirbrakeAppender" do
  describe "#add" do
    before(:each) do
      @appender = Hatchet::AirbrakeAppender.new
      @appender.api_key = @api_key = random_string
      @level = random_string
      @context = random_string
      @error = StandardError.new
      @backtrace = [random_string, random_string]
      @error.stub(:backtrace) { @backtrace }

      @message = Hatchet::Message.new(@error_message = random_string, @error)
    end

    subject { @appender.add(@level, @context, @message) }

    it "should notify airbrake" do
      expected_options = {
        :api_key => @api_key,
        :error_message => @error_message,
        :backtrace => @backtrace
      }
      Airbrake.should_receive(:notify).with(@error, expected_options)
      subject
    end

    context "when error is not present" do
      before(:each) do
        @message = Hatchet::Message.new(random_string)
      end
      it "should not notify airbrake" do
        Airbrake.should_not_receive(:notify)
        subject
      end
    end
  end
end