class Pokemon
   attr_accessor :name, :type
   attr_reader :id, :db

   def initialize(id: nil, name:, type:, db:)
      @id = id
      @name = name
      @type = type
      @db = db
   end

   def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
   end

   def self.find(id, db)
      pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", [id])[0]
      self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
   end

end
