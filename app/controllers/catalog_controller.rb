class CatalogController < ApplicationController

  # GET /welcome
  def view
     id = params[:id]
     
     require 'rubygems'
     require 'mongo'
     require 'csv'
     require 'json'
     begin
         #client = Mongo::Client.new([ 'localhost:27017' ], :database => 'music')
         #mongo_client = Mongo::Client.new(['localhost'], 27017)
         #db = Mongo::Client.new(["mongo ds031912.mongolab.com:31912"]).db("heroku_mhz4f7bj")
         client = Mongo::Client.new([ 'ds019471.mlab.com:19471' ], :database => 'heroku_cbfd30fr', :user => 'testdb', :password => '02021993')
         puts "Connected"
         
         
         #id = gets
         #id = id.to_a
         client[:health].find(:id => id.to_i).each do |row|
             puts "Query1:"
             puts "%s %s %s %s %s %s %s" % [ row['age'].to_s, row['sex'].to_s, row['race'].to_s, row['length_of_stay'].to_s, row['stay_indicator'].to_s, row['total_charges'].to_s, row['id'].to_s ]
             render :json => row
         end
     end
    
end
