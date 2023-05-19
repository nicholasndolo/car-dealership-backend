Admin.all.destroy_all
Vehicle.all.destroy_all
Review.all.destroy_all
Testimonial.all.destroy_all

puts "Seeding admin..."

    Admin.create(
        name: Faker::Name.name, 
        email: "admin.nickmotors@gmail.com",
        avatar_url: Faker::Avatar.image(slug: "my-own-slug"),
        password_digest: "Admin@254"
    )
    puts "Seeding cars..."

    Vehicle.create(name: "Bently Continental Gt",image: "https://images.hindustantimes.com/auto/img/2022/02/13/600x338/Bentley_Continental_GT_1644744323672_1644744336562.jpg",category: "convertible",price: 9200,transmission: "Automatic",drive: "4WD",mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Range Rover Evoque",image: "https://images.hindustantimes.com/auto/img/2022/02/13/600x338/Bentley_Continental_GT_1644744323672_1644744336562.jpg",category: "SUV",price: 7200,transmission: "Automatic",drive: "4WD",mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Mercedes-Benz S-Class", image: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/55/Mercedes-Benz_W223_IMG_6663.jpg/640px-Mercedes-Benz_W223_IMG_6663.jpg",category: "convertible", price: 6200, transmission: "Automatic", drive: "4WD", mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "BMW 7 Series", image: "https://img-ik.cars.co.za/news-site-za/images/2022/08/i71.jpg", category: "convertible", price: 5600, transmission: "Automatic", drive: "4WD",mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Nissan Rogue Sport", image: "https://images.hgmsites.net/lrg/2021-nissan-rogue-sport_100781830_l.jpg", category: "convertible", price: 6500, transmission: "Automatic", drive: "4WD", mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Bently Flying Spur", image: "https://i.ytimg.com/vi/qW8MokDzkvo/maxresdefault.jpg", category: "convertible", price: 6200, transmission: "Automatic", drive: "4WD", mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Audi E-Tron Sportback", image: "https://cdn.motor1.com/images/mgl/b2WRv/s6/audi-e-tron-sportback-new-rendering.jpg", category: "convertible", price: 5600, transmission: "Automatic", drive: "4WD", mileage: 1500, admin_id: Admin.first.id)
    Vehicle.create(name: "Toyota Mark X 250G", image: "https://i.pinimg.com/originals/d5/02/bc/d502bce9f4224fba7505b2e0a7b19b2b.jpg", category: "convertible", price: 4200, transmission: "Automatic", drive: "4WD", mileage: 1500, admin_id: Admin.first.id)

puts "Seeding reviews..."

    23.times do
        Review.create(
        review: Faker::Lorem.sentence,
        vehicle_id: Vehicle.all[rand(Vehicle.count)].id
        )
    end

puts "Seeding testimonials....."

    10.times do 
        Testimonial.create(
            testimonial: Faker::Lorem.sentence,
            author_avatar: Faker::Avatar.image(slug: "my-own-slug"),
            author: Faker::Name.name,
            status: ["Acive", "Inactive"].shuffle.first,
            admin_id: Admin.all[rand(Admin.count)].id
        )
    end

puts 'Successfully seeded data🌱🌱!'