require 'factory_girl_rails'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

puts "Populate test users...".green

User.roles.each_pair do |role, _value|
  user = FactoryGirl.create(:user, role: role, email: "#{role}@mail.com")
  puts "\t #{role}: #{user.full_name} (#{user.email}) ".yellow
end

puts "Populate problems categories...".green

[
  'Проблеми лісів',
  'Сміттєзвалища',
  'Незаконна забудова',
  'Проблеми водойм',
  'Загрози біорізноманіттю',
  'Браконьєрство',
  'Інші проблеми',
].each_with_index do |name, index|
  category = FactoryGirl.create(:problem_category, name: name, marker: File.open(Rails.root.join('app', 'assets', 'images', 'markers', "marker_#{index.next}.png")))
  puts "\t #{category.name} ".yellow
end

puts "Populate problems...".green
ProblemCategory.find_each do |category|
  problem = FactoryGirl.create :problem, problem_category: category
  user = User.first

  rand(10).times do |_i|
    problem.comments << FactoryGirl.create(:comment, author: user)
  end

  puts "\t #{problem.title} ".yellow
end
