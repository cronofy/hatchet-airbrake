require_relative 'spec_helper'

describe "AirbrakeAppender" do
  describe "#add" do
    before(:each) do
      @appender = Hatchet::AirbrakeAppender.new
      @level = random_string
      @context = random_string
      @error = StandardError.new
      @backtrace = [random_string, random_string]
      @error.stub(:backtrace) { @backtrace }
      @error_message = random_string

      @message = Hatchet::Message.new(message: @error_message, error: @error)
    end

    let(:message) { Hatchet::Message.new(message: @error_message, error: @error) }
    subject { @appender.add(@level, @context, message) }

    it "notifies airbrake" do
      expected_options = {
        :error_message => @error_message,
        :backtrace => @backtrace
      }
      expect(::Airbrake).to receive(:notify).with(@error, expected_options)
      subject
    end

    context "when error is not present" do
      let(:message) { Hatchet::Message.new(random_string) }

      it "does not notify airbrake" do
        expect(::Airbrake).to_not receive(:notify)
        subject
      end
    end
  end
end
