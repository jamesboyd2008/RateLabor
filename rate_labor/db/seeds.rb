# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do |iteration|
  Company.create(
    name: Faker::Company.name,
    description: Faker::Company.catch_phrase
  )
  3.times do
    Recruiter.create(
      name: Faker::Name.first_name, email: Faker::Internet.email,
      phone: Faker::PhoneNumber.cell_phone,
      company_id: iteration
    )
    3.times do
      Review.create(
        content: Faker::Lorem.paragraph,
        reviewable_id: Recruiter.all.length - 1,
        positivity: [true, false].sample,
        reviewable_type: "Recruiter"
      )
    end
  end
  3.times do
    Review.create(
      content: Faker::Lorem.paragraph,
      reviewable_id: iteration,
      positivity: [true, false].sample,
      reviewable_type: "Company"
    )
  end
end
