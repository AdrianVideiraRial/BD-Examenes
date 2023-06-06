-- Trabajamos con la colección movies de la BD sample_mflix

use sample_mflix

-- 1. Actualiza el campo year de la pelicula de título “Civilization” a “1985”.
db.movies.updateOne({ title: "Civilization" }, { $set: { year: "1985" } })
db.movies.find({title:"Civilization"}, {title:1, year:1, _id:0})

-- 2. Actualiza el campo comentarios de todas las películas, sumándole 10.
db.movies.updateMany({}, { $inc: {num_mflix_comments: 10 } })
db.movies.find({},{num_mflix_comments:1, title:1, _id:0})

-- 3. Actualiza el campo year de las peliculas con duración (runtime) mayor a 100 para que sea 100 (es decir, no habrá ninguna duración mayor que 100)
db.movies.updateMany({runtime: {$gt:100}}, { $set: {year: 100} })
db.movies.find({runtime: {$gt:100}},{title:1, runtime:1, year:1, _id:0})

-- 4. Borra las que sean el género Action.
db.movies.deleteMany({ genres:"Action" })
db.movies.find({ genres:"Action" })

-- 5. Borra las películas de entre los años 1950 y 1970 y que tengan menos de 80 votos en imdb.
db.movies.deleteMany({year:{$gt:1950, $lt:1970}, }) ....No encuentro el valor votos..
