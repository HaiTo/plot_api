class AppConfig
  Root = File.expand_path('..', __FILE__)
  ImageSize = '1200x600'
  DefaultTheme = 'theme_rails_keynote'
  Themes = %w(theme_keynote
              theme_37signals
              theme_rails_keynote
              theme_odeo
              theme_pastel
              theme_greyscale).freeze
end

class Paths
  Server = File.join(AppConfig::Root, 'app', 'server.rb')
  Graph = File.join(AppConfig::Root, 'app', 'graph.rb')
  Font = File.join(AppConfig::Root, 'assets', 'RictyDiminished-Regular.ttf')
end

require 'active_support/all'
require 'gruff'
require 'sinatra'
require 'json'

require Paths::Graph
require Paths::Server
