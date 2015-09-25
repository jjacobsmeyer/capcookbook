
admin = User.new(
  name: 'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)
admin.skip_confirmation!
admin.save!

member = User.new(
  name: 'Member User',
  email:    'member@example.com',
  password: 'helloworld',
)
member.skip_confirmation!
member.save!

Recipe.create(title: "Green Beans", body: "Preheat the greenbeans in the microwave.", category: "vegetables")
Recipe.create(title: "Beef Tenderloin", body: "Preheat the tenderloin in the oven.", category: "meat")

puts "Seed finished"
