require 'rspec'
require 'album'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil) 
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", '2021', 'pop', 'two', nil)
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.clear') do
    it("clears all albums") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil)
      album2.save()
      Album.clear()
      expect(Album.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album.update("A Love Supreme", '2020', 'RnB', 'three')
      expect(album.name).to(eq("A Love Supreme"))
      expect(album.year).to(eq('2020'))
      expect(album.genre).to(eq('RnB'))
      expect(album.artist).to(eq('three'))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('#search') do
    it("search by name") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new("Blue", '2021', 'pop', 'two', nil)
      album2.save()
      temp = {album2.id=>album2}
      expect(Album.search("Blue")).to(eq(temp))
    end
  end

  describe('#sort') do
    it("sort by name") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      album2 = Album.new('Blue', '2021', 'pop', 'two', nil)
      album2.save()
      album3 = Album.new('a', '2021', 'saf', 'two', nil)
      album3.save()
      expect(Album.sort().values[0]).to(eq(album3))
      expect(Album.sort().values[1]).to(eq(album2))
      expect(Album.sort().values[2]).to(eq(album))
    end
  end

  describe('#songs') do
    it("returns an album's songs") do
      album = Album.new('Giant Steps', '2021', 'rap', 'one', nil)
      album.save()
      song = Song.new("Naima", album.id, nil)
      song.save()
      song2 = Song.new("Cousin Mary", album.id, nil)
      song2.save()
      expect(album.songs).to(eq([song, song2]))
    end
  end

end