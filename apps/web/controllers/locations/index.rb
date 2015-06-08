require 'google_places'
module Web::Controllers::Locations
  class Index
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

      @results=google_places_collections(params)
      puts @results.first.inspect
      # self.body = @results.inspect
    end


    def google_places_collections(params)
      address=params['address']
      @client = GooglePlaces::Client.new(ENV['API_KEY'])
      return results = if !(address=='')
        @client.spots_by_query(address) #Pizza near Miami Florida
      else
        @client.spots(params['latitude'], params['longitude'], :radius => params['radius']) #-33.8670522, 151.1957362 100
                       end
    end

  end
end
