module Tracker
  class Rack

    def initialize(app)
      @app = app
    end

    def call(env)

      @req = ::Rack::Request.new(env)
      if @req.path_info =~ /tracker.png/
        result = Services::Params.deploy @req.query_string
        location = Services::Locations.lookup(@req.ip)
        ip_address = location["ip"] || @req.ip
        track_id = result[:track]
        params = {
          ip_address:     ip_address,
          city:           location["city"],
          state:          location["region_name"],
          user_agent:     @req.user_agent,
          provider:       @req.referer,
          track_id:        track_id
          }

        if Track.where(id: track_id).present?
          if @pixels = Pixel.create!(params)
            [
              200, { 'Content-Type' => 'image/png' },
              [File.read(File.join(File.dirname(__FILE__), 'tracker.jpg'))]
            ]
          else
            Rails.logger.warn "\n\n Failed to create record on:#{Date.today}"
          end
        else
          Rails.logger.warn "\n\n Failed to create record on:#{Date.today}"
          [
            200, { 'Content-Type' => 'image/png' },
            [File.read(File.join(File.dirname(__FILE__), 'tracker.jpg'))]
          ]
        end
      else
        @app.call(env)
      end
    end

  end
end
