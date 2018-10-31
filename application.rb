require 'sinatra'
require 'sinatra/json'
require 'bundler'
require 'rubygems'

Bundler.require
require './lib/review'

configure :production do
    DataMapper.setup(:default, ENV['HEROKU_POSTGRESQL_RED_URL'])
end

configure :development do
    DataMapper.setup(:default,'sqlite::memory:')
    
end

DataMapper.finalize
DataMapper.auto_migrate!

get '/' do
    #"Hello World!"
    erb :index
end

get '/reviews' do
    content_type :json
    reviews = Review.all
    reviews.to_json
end

get '/reviews/:id' do
    content_type :json
    review = Review.get params[:id]
    review.to_json
end

post '/reviews' do
    content_type :json
    review = Review.new
    review.name = params[:name]
    review.adress = params[:adress]
    review.name = params[:name]
    review.city = params[:city]
    review.country = params[:country]
    review.tlf = params[:tlf]
    
    if review.save
        status 201
        redirect("/")
    else
        status 500
        json review.errors.full_messages
    end
end

get '/companies' do
    erb :readme
end


