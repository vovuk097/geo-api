module Web::Controllers::Home
  class Create
    include Web::Action

    expose :home

    params do
      param :latitude, presence: false
      param :longitude, presence: false
      param :address, presence: false
    end

    def call(params)
      @client = GooglePlaces::Client.new('AIzaSyCOw6h3Ih1vFk5EghRTENiNlNTAOOg3Llo')
      @spot = @client.spots(params['latitude'], params['longitude'])
      self.body = @spot
    end
  end
end
