require 'rubygems'
require 'mongo'
require 'csv'
require 'json'
begin
    #client = Mongo::Client.new([ 'localhost:27017' ], :database => 'music')
    #mongo_client = Mongo::Client.new(['localhost'], 27017)
    #db = Mongo::Client.new(["mongo ds031912.mongolab.com:31912"]).db("heroku_mhz4f7bj")
    client = Mongo::Client.new([ 'ds021741.mlab.com:21741' ], :database => 'heroku_f4tlc21c', :user => 'testdb', :password => '02021993')
    puts "Connected"
    
    #coll = db.collection("testCollection")
    #puts "Collection created"
    #mongoimport --db heroku_mhz4f7bj --collection sample --type csv --headerline --file 6339_Dataset_1.csv
    #mongoimport --db heroku_mhz4f7bj --type csv --headerline --file 6339_Dataset_1.csvmongoimport --host=127.0.0.1 -d database_name -c collection_name --type csv --file csv_location --headerline
    #mongoimport --host=ds031912.mongolab.com:31912 -d heroku_mhz4f7bj --type csv --file 6339_Dataset_1.csv --headerline
    #data = CSV.read('6339_Dataset_1.csv')
    #CSV.parse(data).to_json
    
    extracted_data   = CSV.table('6339_Dataset_1.csv')
    transformed_data = extracted_data.map { |row| row.to_hash }
    #puts transformed_data
    puts "file transformed"
    #puts transformed_data
    #health.drop
    data = client[:dat, :capped => false, :size => 2048]
    data.create
    puts "Collection Created"
    transformed_data.each do |data_row|
        #puts data_row
        data.insert_one(data_row)
    end
#    puts "Enter the ID:"
#    id = gets
#    id = id.to_a

    client[:dat].find().each do |row|
        puts "Query1:"
         puts "%s %s %s %s %s %s %s" % [ row['age'].to_s, row['sex'].to_s, row['race'].to_s, row['length_of_stay'].to_s, row['stay_indicator'].to_s, row['total_charges'].to_s, row['id'].to_s ]
        
        
    end
    
end
