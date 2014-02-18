namespace :db do 
   desc 'Fill database with sample data'
   task populate: :environment do
       admin = User.create!(name: "xieyizun",
       	            email: "1824762899@qq.com",
       	            password: "abc111111",
       	            password_confirmation: "abc111111",
       	)
       admin.toggle!(:admin)
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
        users = User.all(limit: 6)
        50.times do
          content = Faker::Lorem.sentence(10)
          users.each {|user| user.microposts.create!(content:content)}
        end

        make_relationships
    end

    def make_relationships
      users = User.all
      user = users.first
      followed_users = users[2..50]
      followers = users[3..40]
      followed_users.each {|followed| user.follow!(followed)}
      followers.each {|follower| follower.follow!(user)}
    end

end