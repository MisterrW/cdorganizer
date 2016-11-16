require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')
require_relative('models/song')

Song.delete_all()
Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'Prince'
  })

artist1.save()

artist1.name = 'The artist formerly known as Prince'

artist1.update()


artist2 = Artist.new({
  'name' => 'Daft Punk'
  })

artist2.save()


album1 = Album.new({
  'title' => 'Purple Rain',
  'genre' => 'Rock',
  'artist_id' => artist1.id
  })

album1.save()

album1.title = 'Purple shame'

album1.update()

album2 = Album.new({
  'title' => 'Discovery',
  'genre' => 'French House',
  'artist_id' => artist2.id
  })

album2.save()

song = Song.new({
  'name' => 'When Doves Cry',
  'length' => '5.52',
  'artist_id' => artist1.id,
  'album_id' => album1.id
  })

song.save()

song2 = Song.new({
  'name' => 'One More Time',
  'length' => '5.20',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song2.save()

song3 = Song.new({
  'name' => 'Aerodynamic',
  'length' => '3.27',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song3.save()

song4 = Song.new({
  'name' => 'Digital Love',
  'length' => '4.58',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song4.save()

song5 = Song.new({
  'name' => 'Harder, Better, Faster, Stronger',
  'length' => '3.45',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song5.save()

song6 = Song.new({
  'name' => 'Crescendolls',
  'length' => '3.31',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song6.save()

song7 = Song.new({
  'name' => 'Nightvision',
  'length' => '1.44',
  'artist_id' => artist2.id,
  'album_id' => album2.id  
  })

song7.save()

binding.pry
nil