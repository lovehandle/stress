module Stress
  class Client < EventMachine::HttpClient

    def initialize(client)
      @start_time = Time.now
      @client = client
    end

    def response_time
      end_time - start_time
    end

    def status
      client.response_header.http_status
    end

    def success?
      status == 200
    end

    def callback(&b)
      block = Proc.new { @end_time = Time.now; b.call(self) }
      client.callback(&block)
    end

    def respond_to?(m)
      super || client.respond_to?(m)
    end

    def method_missing(m, *args, &block)
      if client.respond_to?(m, *args, &block)
        client.send(m, *args, &block)
      else
        raise NoMethodError, "undefined method `#{m}` for #{self.class}"
      end
    end

    def to_h
      { status: status, response_time: response_time }
    end

    def to_s
      to_h.to_s
    end

    private

    attr_reader :client, :start_time, :end_time

  end
end
