# README

* Bước 1: Fork Project về.
* Bước 2: Clone Prject vừa fork về
* Bước 3: tạo file .env ```AwesomeSchedule/.env``` <br>

Trong ví dụ trong env:
```ruby
DATABASE_USERNAME=root
DATABASE_PASSWORD=123456
DATABASE_SOCKET=/var/run/mysqld/mysqld.sock
# trong ubuntu / mac la khac

```

* Bước 4: Các lệnh để chạy:
```ruby
bundle install 

yarn install --check-files  

rake db:create

rails db:migrate

rake db:seed

rails s
```

