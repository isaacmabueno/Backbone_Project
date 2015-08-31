require './app'
require './lddaily'
require 'dotenv'
Dotenv.load

run Sinatra::Application
