use aplicacion_viajes

db.createCollection("turistas")

db.createCollection("vuelos")

db.createCollection("ciudades")

-- Insertamos los datos en la coleción turistas.
db.turistas.insertMany(
	[
		{
			"nombre": "Juan",
			"apellido": "García",
			"fecha_nacimiento": ISODate("1989-05-10"),
			"pais": "España"
		},
		{
			"nombre": "María",
			"apellido": "López",
			"fecha_nacimiento": ISODate("1990-09-22"),
			"pais": "España"
		},
		{
			"nombre": "Pedro",
			"apellido": "Martínez",
			"fecha_nacimiento": ISODate("1978-12-01"),
			"pais": "España"  }
	])

-- Insertamos los datos en la coleción vuelos.
db.vuelos.insertMany(
	[ 
		{ 
			"origen": "Madrid",
			"destino": "Barcelona",
			"fecha_salida": ISODate("2023-01-10T09:00:00Z"),
			"fecha_llegada": ISODate("2023-01-10T11:00:00Z")
		},
		{
			"origen": "Sevilla",
			"destino": "Valencia",
			"fecha_salida": ISODate("2023-05-12T14:30:00Z"),
			"fecha_llegada": ISODate("2023-05-12T16:30:00Z")
		},
		{    
			"origen": "Barcelona",
			"destino": "Vigo",
			"fecha_salida": ISODate("2023-04-15T08:00:00Z"),
			"fecha_llegada": ISODate("2023-04-15T10:00:00Z")
		}
	])
	
-- Insertamos los datos en la coleción ciudades.
db.ciudades.insertMany(
	[
		{
			"nombre": "Madrid",
			"habitantes": 3200000,
			"descripcion": "Madrid es la capital de España y cuenta con una amplia oferta cultural y gastronómica."
		},
		{
			"nombre": "Barcelona",
			"habitantes": 1620300,
			"descripcion": "Barcelona es una ciudad situada al noroeste de España con una gran cantidad de atracciones turísticas, como la Sagrada Familia y el Parque Güell."
		},
		{ 
			"nombre": "Valencia",
			"habitantes": 791400,
			"descripcion": "Valencia es conocida por su arquitectura moderna y su famosa paella."
		},
		{
			"nombre": "Sevilla",
			"habitantes": 681998,
			"descripcion": "Sevilla es una bonita ciudad situada al sur de España sus mejores monumentos son: La Giralda, Plaza de España y la Catedral entre otros muchos "
		},
		{
			"nombre": "Vigo",
			"habitantes": 293837,
			"descripcion": "La mejor ciudad de Galicia situada al noroeste de España, destaca por su gastronomía y playas, tiene un bonito parque natural para visitar: Las islas Cies"
		}
	])


	
