10.times do
  User.create(email: Faker::Internet.email,
              password: 'password',
              password_confirmation: 'password')
end

puts '10 Users created!'

10.times do
  Crag.create(name: Faker::Address.city,
              country: Faker::Address.country,
              x: rand,
              y: rand
            )
end
puts '10 Crags created!'

10.times do
  Sector.create(
    name: Faker::BossaNova.song,
    aspect: Faker::Cat.breed,
    crag_id: rand(10)
  )
end
puts '10 sectors created'
