
User.create!(name: "Test",
  email: "test@gmail.com",
  job: "test",
  password: "12345678",
  )

def rand_time(from, to=Time.now + 1.days)
  Time.at(from + rand * (to.to_f - from.to_f))
end
# create task
