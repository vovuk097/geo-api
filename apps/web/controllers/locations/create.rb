require 'google_places'
module Web::Controllers::Locations
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
      self.format = :json

      options = params.to_hash
      get_proxi(options)

      @location = {
        latitude: params['latitude'],
        longitude: params['longitude'],
        radius: params['radius'],
        address: params['address']
      }
    end


    def get_proxi(params)
      address=params['address']
      @client = GooglePlaces::Client.new(ENV['API_KEY'])
      results = if !(address=='')
        @client.spots_by_query(address) #Pizza near Miami Florida
      else
        @client.spots(params['latitude'], params['longitude'], :radius => params['radius']) #-33.8670522, 151.1957362 100
      end
      self.body = result.inspect
    end

  end
end
