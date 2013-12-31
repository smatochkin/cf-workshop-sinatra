require 'sinatra'
require 'sinatra/activerecord'
require 'json'

if ( ENV['VCAP_APPLICATION'] )
  VCAP_HASH = JSON.load(ENV["VCAP_APPLICATION"]).to_hash 
else
  VCAP_HASH = { }
end

class Attendee < ActiveRecord::Base
end

class Session < ActiveRecord::Base
end

get '/kill' do
  erb :kill
  Sinatra::Application.quit!
end

get '/sessions' do
  @sessions = Session.order("id DESC")
  erb :sessions
end

get '/attendees' do
  @attendees = Attendee.order("id DESC")
  erb :attendees
end

get '/' do
  erb :index
end

get '/index' do
  erb :index
end
