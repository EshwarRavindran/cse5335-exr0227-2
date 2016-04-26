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
         client[:climate].find(:id => id.to_i).each do |row|
             puts "Query1:"
             puts "%s %s %s %s %s %s %s" % [ row['latitude'].to_s, row['longitude'].to_s, row['depth'].to_s, row['mag'].to_s, row['nst'].to_s, row['gap'].to_s, row['id'].to_s ]
             render :json => row
         end
     end
     
  end
  
en
   