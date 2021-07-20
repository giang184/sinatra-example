class Album
  attr_reader :id, :year, :genre, :artist
  attr_accessor :name
  @@albums = {}
  @@total_rows = 0 # We've added a class variable to keep track of total rows and increment the value when an Album is added.

  def initialize(name, year, genre, artist, id) # We've added id as a second parameter.
    @name = name
    @year = year
    @genre = genre
    @artist = artist
    @id = id || @@total_rows += 1  # We've added code to handle the id.
  end

  def self.all
    @@albums.values()
  end

  def save
    @@albums[self.id] = Album.new(self.name, self.year, self.genre, self.artist, self.id)
  end

  def ==(album_to_compare)
    self.name() == album_to_compare.name() && self.year == album_to_compare.year() && self.genre() == album_to_compare.genre() && self.artist() == album_to_compare.artist()
  end

  def self.clear
    @@albums = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@albums[id]
  end

  def update(name, year, genre, artist)
    @name = name
    @year = year
    @genre = genre
    @artist = artist
  end

  def delete
    @@albums.delete(self.id)
  end


  def self.search(name)
    @@albums.select{|key, value| value.name == name}
  end


  # def self.sort
  #   # for each item in the hash, retrieve the names and push into array. Sort the array. Then search for each names in the array (which returns Album object), push that into a new Hash. Reassign
  #   @@albums=Hash[@@albums.sort]
  # end
end