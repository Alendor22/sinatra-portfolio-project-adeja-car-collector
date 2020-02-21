User.create({name: "adeja", username: "alendor", location: "NYC", password:"test"})
User.create({name: "micah", username: "mlendor", location: "NJ", password:"test"})

Car.create({year: 2020, make: "Audi", model: "S4", location: "NYC", price: 63495, status: false, owner_id: 2})
Car.create({year: 2021, make: "Porsche", model: "Taycan", location: "CA", price: 135995, status: true, owner_id: 1})
Car.create({year: 2019, make: "Mercedes-Benz", model: "SLS", location: "VA", price: 203595, status: true, owner_id: 1})
Car.create({year: 2018, make: "Tesla", model: "S-P90D", location: "NJ", price: 115395, status: false, owner_id: 2})

Favorite.create({car_id: 1, user_id: 1})
Favorite.create({car_id: 2, user_id: 1})
Favorite.create({car_id: 1, user_id: 2})
Favorite.create({car_id: 3, user_id: 2})
Favorite.create({car_id: 2, user_id: 2})
Favorite.create({car_id: 4, user_id: 1})