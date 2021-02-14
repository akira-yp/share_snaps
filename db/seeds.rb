50.times do |n|
  name = "user#{n}"
  email = "user#{n}@test.com"
  User.create!(
    name: name,
    email: email,
    password: "password",
    password_confirmation: "password"
  )
end
