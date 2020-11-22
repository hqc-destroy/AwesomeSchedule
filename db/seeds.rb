
User.create!(name: "Test",
  email: "test@gmail.com",
  job: "test",
  password: "12345678",
  )

def rand_time(from, to=Time.now + 1.days)
  Time.at(from + rand * (to.to_f - from.to_f))
end
# create task
10.times do  |n|
  user_id = 1
  tasks = "task#{n}"
  start_time = rand_time(3.days.ago).strftime("%Y-%m-%d %H:%M")
  deadline = rand_time(1.days.ago).strftime("%Y-%m-%d %H:%M")
  end_time = deadline
  content = "abc xyz ghk"
  level = (n*127 + (n+17)*13)%3
  status = "0"
  Task.create!( user_id: user_id,
                  tasks: tasks,
                  start_time: start_time,
                  deadline: deadline,
                  end_time: end_time,
                  content: content,
                  level: level,
                  status: status
    )
end
