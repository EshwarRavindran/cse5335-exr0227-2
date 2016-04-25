class CatalogController < ApplicationController

  # GET /welcome
  def view
     i = params[:id]
     
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
         
         v = con.exec("SELECT AGE,SEX,RACE, LENGTH_OF_STAY, STAY_INDICATOR, TOTAL_CHARGES, ID from health where ID = '%d'" % [i])
         
         puts "QUERY 1"
         
         v.each do |row|
             puts "%s %s %s %s %s %s %s" % [ row['age'], row['sex'], row['race'], row['length_of_stay'], row['stay_indicator'], row['total_charges'], row['id'] ]
             
             render :json => row

         end

         rescue PG::Error => e
         
         puts e.message
         
         ensure
         
         con.close if con
         
     end
     #render :json => "Welcome to UTA"
  end

end
