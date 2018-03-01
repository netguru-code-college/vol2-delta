
Crag.create name: "Rudawy Janowickie", country: "Poland", latitude: 50.8083, longitude: 15.8950
Crag.create name: "Sokoliki", country: "Poland", latitude: 50.8699, longitude: 15.8665
Crag.create name: "Jura", country: "Poland", latitude: 50.206667, longitude: 19.829167

7.times do
  Crag.create(
    name: Faker::Address.city,
    country: Faker::Address.country,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end

puts "#{Crag.all.count} crags created"

Crag.all.each do |crag|
  10.times do
    Sector.create(
      name: Faker::BossaNova.song,
      aspect: Faker::Cat.breed,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      crag_id: crag.id
    )
  end
end
puts "#{Sector.all.count} sectors created"



10.times do
  User.create(email: Faker::Internet.email,
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              password: 'password',
              password_confirmation: 'password')
end

puts "#{User.all.count} Users created!"

AscentStyle.create(style: 'RP', points: 0)
AscentStyle.create(style: 'OS', points: 150)
AscentStyle.create(style: 'FL', points: 50)

puts "#{AscentStyle.all.count} ascent style created"

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

Sector.all.each do |sector|
  5.times do
    ClimbingRoute.create(
      name: Faker::Beer.name,
      number_of_ascents: 0,
      sector_id: sector.id,
      route_grade_id: (RouteGrade.all.map(&:id)).sample
    )
  end
end

puts "#{ClimbingRoute.all.count} climbing routes created"

ClimbingRoute.all.each do |climbing_route|
  5.times do
    Ascent.create(
      comment: Faker::Beer.name,
      date: Faker::Date.between(2.years.ago, Date.today),
      user_id: (User.all.map(&:id)).sample,
      climbing_route_id: climbing_route.id,
      ascent_style_id: (AscentStyle.all.map(&:id)).sample,
    )
    climbing_route.increment!(:number_of_ascents)
  end
end

puts "#{Ascent.all.count} ascents created"
