module Stress
  class Connection < EventMachine::HttpConnection

    def get
      Client.new(super)
    end

  end
end
