# appel des gems du Gemfile
require 'pry'
require 'bundler'
Bundler.require

# appel des librairies sans relative path
$:.unshift File.expand_path("./../lib", __FILE__)
require 'views/application'

# binding.pry

Application.new.perform
