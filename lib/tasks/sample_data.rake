namespace :db do 
   desc 'Fill database with sample data'
   task populate: :environment do
       User.create!(name: "xieyizun",
       	            email: "1824762899@qq.com",
       	            password: "abc111111",
       	            password_confirmation: "abc111111",
       	)
       99.times do |n|
       	name = Faker::Name.name
       	email = "example-#{n+1}@railstutorial.org"
       	password = "password"
       	User.create!(name: name,
       		         email: email,
       		         password: password,
       		         password_confirmation: password,
       		)
        end
    end
end