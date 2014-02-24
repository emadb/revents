require 'rubygems'
require 'redis'
require 'mongo'
require 'sequel'
require 'json'
require 'active_support'
require 'wisper'
require './app/aggregate_root_helper'
require './app/base_consumer'
require './app/base_denormalizer'
require './app/commits_repository'
require './app/core_ext'

require './app/app_settings'

Dir['./app/denormalizers/**/*.rb'].each { |f| require f }
Dir['./app/consumers/**/*.rb'].each { |f| require f }
Dir['./app/basket_management/**/*.rb'].each { |f| require f }

require './app/server'


start
