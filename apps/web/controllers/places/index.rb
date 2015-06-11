require 'google_places'
module Web::Controllers::Places
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

      @results = google_places_result(params)
      # self.body = @results.inspect
    end

    def google_places_result(params)
      @client = GooglePlaces::Client.new(ENV['API_KEY'])
      return results = if !(params['address']=='')
         @client.spots_by_query(params['address'])
      else
         @client.spots(params['latitude'], params['longitude'], :radius => params['radius'].to_f)
      end
    end
  end
end
