50.times do |n|
  name = "user#{n}"
  email = "user#{n}@test.com"
  User.create!(
    name: name,
    email: email,
    password: "password",
    password_confirmation: "password",
    greeting: "初めまして！#{name}といいます。よろしくお願いします！",
    avatar: File.open("./db/fixtures/avatar#{n}.png")
  )
end
