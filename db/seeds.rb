# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name:  "Example User",
             email: "admin@example.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)
20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

["Easy", "Medium", "Hard"].each do |ct|
  Category.create(name: ct)
end

wq = {
    "pen" => {"Tool_to_write" => true, "Tool_to_read" => false, "Tool_to_sketch" => false, "Tool_to_cook" => false},
    "color" => {"Tool" => false, "Weapon" => false, "Sense_of_vision" => true, "Article" => false},
    "A" => {"a" => true, "b" => false, "c" => false, "d" => false},
    "B" => {"a" => false, "b" => true, "c" => false, "d" => false},
    "C" => {"a" => false, "b" => false, "c" => true, "d" => false},
    "D" => {"a" => false, "b" => false, "c" => false, "d" => true}
}

wq.each do |wrd, wns|
  word = Category.find(2).words.create(content: wrd)
  wns.each do |i ,j|
    word.word_answers.create(content: i, correct: j)
  end
end

@lsn = User.find_by(email: "admin@example.org").lessons.create(category_id: 2)
@lsn.words << [Word.find(1), Word.find(2)]
@lsn.word_answers << [@lsn.words.first.word_answers.find_by(content: "Tool_to_read")]
@lsn.word_answers << [@lsn.words.second.word_answers.find_by(content: "Sense_of_vision")]

# Following relationships
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }