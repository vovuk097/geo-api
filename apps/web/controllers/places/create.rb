require 'google_places'
module Web::Controllers::Places
  class Create
    include Web::Action

    expose :results

    params do
      param :latitude, presence: false
      param :longitude, presence: false
      param :radius, presence: false
      param :address, presence: false
    end

    def call(params)
      results = {}
      @client = GooglePlaces::Client.new(ENV['API_KEY'])
      @spot = @client.spots(params['latitude'], params['longitude'], :radius => params['radius'].to_f)
      @spot_address = @client.spots_by_query('Pizza near Miami Florida')
      results[:spot] = @spot
      results[:spot_address] = @spot_address
      self.body = results.inspect
    end
  end
end
