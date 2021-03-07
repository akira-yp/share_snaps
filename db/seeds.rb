50.times do |n|
  my_name = "user#{n}"
  my_email = "user#{n}@test.com"
  User.create!(
    name: my_name,
    email: my_email,
    password: "password",
    password_confirmation: "password",
    greeting: "初めまして！#{my_name}といいます。よろしくお願いします！",
    avatar: File.open("./db/fixtures/avatar#{n}.png")
  )
end
