require 'factory_girl_rails'

puts "Populate test users...".green

User.roles.each_pair do |role, _value|
  user = FactoryGirl.create(:user, role: role, email: "#{role}@mail.com")
  puts "\t #{role}: #{user.full_name} (#{user.email}) ".yellow
end
