get 'home/index', to: 'home#index'
resources :places, only: [:create, :new]

# Configure your routes here
# See: http://www.rubydoc.info/gems/lotus-router/#Usage
#
#
#
# This route will look for `Web::Controllers::Home::Index` action in `apps/web/controllers/home/index.rb`.
# Please, uncomment the following line to have a working example.
# get '/', to: 'home#index'
