module Tracker
  class Rack

    def initialize(app)
      @app = app
    end

    def call(env)
      Rails.logger.warn "\n\n Failed to create record "

      @req = ::Rack::Request.new(env)
      if @req.path_info =~ /tracker.gif/
        result = Services::Params.deploy @req.query_string
        location = Services::Locations.lookup(@req.ip)
        ip_address = location["ip"] || @req.ip
        params = {
          ip_address:     ip_address,
          city:           location["city"],
          state:          location["region_name"],
          user_agent:     @req.user_agent,
          # provider:       @req.referer
        }

        if @pixels = Pixel.create!(params)
          [
            200, { 'Content-Type' => 'image/gif' },
            [File.read(File.join(File.dirname(__FILE__), 'tracker.gif'))]
          ]
        else
          Rails.logger.warn "\n\n Failed to create record on:#{Date.today}"
        end
      else
        @app.call(env)
      end
    end

  end
end
