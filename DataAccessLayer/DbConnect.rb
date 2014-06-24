require 'rubygems'
require 'sinatra'
require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  'MySite.sqlite3.db'
)
