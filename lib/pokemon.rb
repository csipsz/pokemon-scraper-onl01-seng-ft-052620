require 'pry'
class Pokemon

    attr_accessor :name, :type, :db 
    attr_reader :id
    def initialize(id: nil, name:, type:, db:)
        @id = id 
        @name = name 
        @type = type 
        @db = db
    end 

def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        
end 

def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    poki = db.execute(sql, id)[0]
    name = poki[1]
    type = poki[2]
    Pokemon.new(id: id, name: name, type: type, db: db)
end 



end 
