module Web::Controllers::Places
  class New
    include Web::Action

    def call(params)
      self.format = :html
    end
  end
end
