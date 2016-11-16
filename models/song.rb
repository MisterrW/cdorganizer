require_relative('../db/sql_runner')

class Song
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @name = options['name']
    @artist_id = options['artist_id']
    @album_id = options['album_id']
    @length = options['length']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "
    INSERT INTO songs
    (name, length, album_id, artist_id)
    VALUES
    ('#{@name}', '#{@length}', #{@album_id}, #{@artist_id})
    returning *
    ;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "
    UPDATE songs
    SET (name, length, album_id, artist_id) =
    ('#{@name}', '#{@length}', #{@album_id}, #{@artist_id}) WHERE id = #{@id}
    ;"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "
    SELECT * FROM artists
    WHERE id = #{@artist_id}
    ;"
    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end

  def albums()
    sql = "
    SELECT * FROM albums
    WHERE id = #{@album_id}
    ;"
    result = SqlRunner.run(sql)
    return result.map{ |hash| Album.new(hash) }
  end

  def delete()
    return unless @id
    sql = "
    DELETE FROM songs
    WHERE id = #{@id}
    ;"
    SqlRunner.run(sql)
  end

  def self.find_song(id)
    sql = "
    SELECT * FROM songs
    WHERE id = #{id}
    ;"

    result = SqlRunner.run(sql)
    return Song.new(result[0])
  end

  def album()
    sql = "
    SELECT * FROM albums
    WHERE id = #{@album_id}
    ;"

    result = SqlRunner.run(sql)
    return Album.new(result[0])
  end

  def artist()
    sql = "
    SELECT * FROM artists
    WHERE id = #{@artist_id}
    ;"

    result = SqlRunner.run(sql)
    return Artist.new(result[0])
  end

  def self.all
    sql = "
    SELECT * FROM songs;
    "
    result = SqlRunner.run(sql)
    return result.map{ |hash| Song.new(hash) }
  end

  def self.delete_all
    sql = "
    DELETE FROM songs;
    "
    SqlRunner.run(sql)
  end

end