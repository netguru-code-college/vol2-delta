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
    latitude: rand(1..100),
    longitude: rand,
    crag_id: rand(10)
  )
end
puts '10 sectors created'


Crag.create name: "Rudawy Janowickie", country: "Poland", latitude: 50.8083, longitude: 15.8950
Crag.create name: "Sokoliki", country: "Poland", latitude: 50.8699, longitude: 15.8665
Crag.create name: "Jura", country: "Poland", latitude: 50.206667, longitude: 19.829167

puts '3 crags created'

AscentStyle.create(style: 'RP', points: 0)
AscentStyle.create(style: 'OS', points: 150)
AscentStyle.create(style: 'FL', points: 50)

puts '3 ascent style created'

RouteGrade.create(grade: '6a', points: 100)
RouteGrade.create(grade: '6a+', points: 150)
RouteGrade.create(grade: '6b', points: 200)
RouteGrade.create(grade: '6b+', points: 250)
RouteGrade.create(grade: '6c', points: 300)
RouteGrade.create(grade: '6c+', points: 350)
RouteGrade.create(grade: '7a', points: 400)
RouteGrade.create(grade: '7a+', points: 450)
RouteGrade.create(grade: '7b', points: 500)
RouteGrade.create(grade: '7b+', points: 550)
RouteGrade.create(grade: '7c', points: 600)
RouteGrade.create(grade: '7c+', points: 650)
RouteGrade.create(grade: '8a', points: 700)
RouteGrade.create(grade: '8a+', points: 750)
RouteGrade.create(grade: '8b', points: 800)
RouteGrade.create(grade: '8b+', points: 850)
RouteGrade.create(grade: '8c', points: 950)
RouteGrade.create(grade: '8c+', points: 1000)
RouteGrade.create(grade: '9a', points: 1050)
RouteGrade.create(grade: '9a+', points: 1100)
RouteGrade.create(grade: '9b', points: 1150)
RouteGrade.create(grade: '9b+', points: 1200)
RouteGrade.create(grade: '9c', points: 1250)

puts 'grading system created'

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
    latitude: rand(1..100),
    longitude: rand,
    crag_id: rand(10)
  )
end
puts '10 sectors created'

10.times do
  ClimbingRoute.create(
    name: Faker::Beer.name,
    grade: rand(1..100),
    number_of_ascents: 0,
    sector_id: rand(10)
  )
end

