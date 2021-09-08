class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name_string)
    new_song = self.new
    new_song.name = song_name_string
    new_song
  end

  def self.create_by_name(song_name_string)
    new_song = self.new
    new_song.name = song_name_string 
    if Song.all.include?(new_song.save)
    else
      new_song.save
    end
    new_song
  end

  def self.find_by_name(song_name_string)
    Song.all.detect do |song|
      song.name == song_name_string
    end
  end

  def self.find_or_create_by_name(song_name_string)
    self.find_by_name(song_name_string) || self.create_by_name(song_name_string)
  end

  def self.alphabetical
    #maybe search for duplicate entries
    new_array = []
    @@all.each do |instance|
      if new_array.include?(instance)
      else
        new_array << instance
      end
    end
    new_array.sort_by{|instance| instance.name}
  end

  #even the official solution doesn't work
  # def self.alphabetical
  #   self.all.sort_by{|s| s.name}
  # end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    name = song_name.gsub('.mp3','')

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    artist_name = data[0]
    song_name = data[1]
    name = song_name.gsub('.mp3','')

    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

end
