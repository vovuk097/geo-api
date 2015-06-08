require 'rubygems'
require 'bundler/setup'
require 'lotus/setup'
require_relative '../lib/geo-api'
require_relative '../apps/web/application'
require 'rabl'
require 'rabl/template'
Lotus::Container.configure do
  mount Web::Application, at: '/api'
end
