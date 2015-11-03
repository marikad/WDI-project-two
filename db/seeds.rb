admin = User.create!(username: "m-dog", email: "m@m.com", password: "password", first_name: "Marika", last_name: "Devan", role: "admin")

u1 = User.create!(username: "a-dog", email: "a@a.com", password: "password", first_name: "Alex", last_name: "Chin")

film = Movie.create!(title: "Inside Out", description: "After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.", image: "http://ia.media-imdb.com/images/M/MV5BOTgxMDQwMDk0OF5BMl5BanBnXkFtZTgwNjU5OTg2NDE@._V1_SX214_AL_.jpg", format: "film", realease_date: "2015")

tv_show = Movie.create!(title: "Friends", description: "Follows the lives of six 20-something friends living in Manhattan.", image: "http://ia.media-imdb.com/images/M/MV5BMTg4NzEyNzQ5OF5BMl5BanBnXkFtZTYwNTY3NDg4._V1._CR24,0,293,443_SX214_AL_.jpg", format: "tv_show", realease_date: "1994")