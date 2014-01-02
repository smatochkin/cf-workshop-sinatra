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

class ClassSession < ActiveRecord::Base
end

get '/kill' do
  Process.kill 'TERM', Process.pid
  erb :kill
end

get '/sessions' do
  if ( params[:attendeeId] )
    @classSessions = ClassSession.where('attendeeId' => params[:attendeeId])
  else
    @classSessions = ClassSession.order("id DESC")
  end
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
