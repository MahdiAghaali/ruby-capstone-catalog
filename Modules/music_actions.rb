require_relative './music_album'
require_relative './genre_actions'
module Music
  include GenreAction

  def create_musicalbum
    puts 'Please enter Publish Date[DD-MM-YYYY]'
    publish_date = gets.chomp
    puts 'Is the music on spotify? [Y/N]'
    response = gets.chomp.upcase
    on_spotify = spotify(response)
    new_music = MusicAlbum.new(publish_date, on_spotify)
    all_genre(new_music)
  end

  def spotify(res)
    return true if res == 'Y'

    false
  end

  def getmusic
    if File.exist?('./data/music_album.json')
      files = File.open('./data/music_album.json', 'r')
      JSON.parse(files.read)

    else
      File.open('./data/music_album.json', 'w') do |_file|
        File.write('./data/music_album.json', [])
        return []
      end
    end
  end

  def show_musicalbum
    if getmusic.empty?
      puts "<<< Music Album list empty >>>\n\n"
    else
      puts 'Music Album List'
      getmusic.each do |element|
        genre = view_genres.select { |i| i['id'] == element['genre_id'] }
        the_genre = genre[0]
        res = if the_genre
                the_genre['name']
              else
                'No genre added'
              end
        puts "Publish Date: #{element['publish_date']} Genre: #{res}"
      end
    end
  end

  def store_music(obj)
    @musis_albums = getmusic
    @musis_albums << obj unless @musis_albums.include? obj
    File.open('./data/music_album.json', 'w') do |_file|
      File.write('./data/music_album.json', JSON.pretty_generate(@musis_albums))
    end
  end
end
