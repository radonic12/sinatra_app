class Review
    include DataMapper::Resource
    
    property :id, Serial
    property :name, String
    property :adress, String
    property :city, String
    property :country, String
    property :tlf, Integer
    
    validates_presence_of :name
    validates_presence_of :adress
    validates_presence_of :city
    validates_presence_of :country

end
