require 'em-http-request'

module Stress

  def self.perform(endpoint: nil, iterations: 10, concurrency: 10, verbose: false)
    iterations.times do |i|
      report = Report.new(i)

      EventMachine.run do
        multi = EventMachine::MultiRequest.new

        concurrency.times do |c|
          client = Stress::Request.new(endpoint).get
          multi.add c, client
        end

        multi.callback do
          clients = multi.responses[:callback]

          clients.each_value do |client|
            report.add(client)
          end

          puts report.title

          puts report.details if verbose

          puts report.summary

          EventMachine.stop
        end
      end
    end
  end

end

require File.join( File.dirname(__FILE__), 'stress', 'report' )
require File.join( File.dirname(__FILE__), 'stress', 'client' )
require File.join( File.dirname(__FILE__), 'stress', 'connection' )
require File.join( File.dirname(__FILE__), 'stress', 'request' )
