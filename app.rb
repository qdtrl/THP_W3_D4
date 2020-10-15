require 'bundler'
Bundler.require
   
$:.unshift File.expand_path("./../lib/app", __FILE__)
$:.unshift File.expand_path("./../lib/views", __FILE__)
$:.unshift File.expand_path("./../db", __FILE__)


require 'morpion'
require 'player'
require 'views'
require 'constants'
require 'io/console'


run = Views.new
run.perform
