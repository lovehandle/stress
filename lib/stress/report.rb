module Stress
  class Report

    def initialize(name)
      @name, @clients = name, []
    end

    def add(client)
      clients << client
    end

    def title
      "Report #{name}"
    end

    def details
      str = "Report #{name}"

      clients.each_with_index do |client, index|
        str += "\n  "
        str += (index + 1).to_s + ': '
        str += client.to_s
      end

      str
    end

    def average_response_time
      clients.inject(0) {|a,b| a += b.response_time } / clients.length
    end

    def number_of_failed_requests
      clients.length - clients.count(&:success?)
    end

    def summary
      str = "  * "
      str += "Average Response Time: " + average_response_time.to_s
      str += "\n  * "
      str += "# of Failed Requests: " + number_of_failed_requests.to_s
    end

    private

    attr_reader :name, :clients

  end
end
