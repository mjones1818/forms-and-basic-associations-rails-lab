class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.create(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def song_notes=(ids)
    ids.each do |id|
      song = Song.find(id)
      self.notes << song
    end
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
         self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end

end
