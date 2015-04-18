class AppConfig
  Root = File.expand_path('..', __FILE__)
  ImageSize = '1200x600'
  Theme = 'theme_rails_keynote'
end

class Paths
  Server = File.join(AppConfig::Root, 'server.rb')
  Graph = File.join(AppConfig::Root, 'graph.rb')
  Font = File.join(AppConfig::Root, 'RictyDiminished-Regular.ttf')
end

require 'active_support/all'
require 'gruff'
require 'sinatra'
require 'json'

require Paths::Graph
require Paths::Server
