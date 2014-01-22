module Stress
  class Request < EventMachine::HttpRequest

    def self.new(uri, options={})
      uri = uri.clone
      connopt = HttpConnectionOptions.new(uri, options)

      Connection.new.tap do |c|
        c.connopts = connopt
        c.uri = uri
      end 
    end

  end
end
