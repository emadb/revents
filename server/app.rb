require 'rubygems'
require 'redis'
require 'mongo'
require 'json'
require './app/aggregate_root_helper'
require './app/core_ext'
Dir['./app/basket_management/**/*.rb'].each { |f| require f }

require './app/server'
start