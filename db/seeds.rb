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
    "pen" => {"Tool to write" => true, "Tool to read" => false, "Tool to sketch" => false, "Tool to cook" => false},
    "color" => {"Tool" => false, "Weapon" => false, "Sense of vision" => true, "Article" => false},
    "A" => {"a" => true, "b" => false, "c" => false, "d" => false},
    "B" => {"a" => false, "b" => true, "c" => false, "d" => false},
    "C" => {"a" => false, "b" => false, "c" => true, "d" => false},
    "D" => {"a" => false, "b" => false, "c" => false, "d" => true},
    "pen1" => {"Tool to write1" => true, "Tool to read" => false, "Tool to sketch" => false, "Tool to cook" => false},
    "color1" => {"Tool" => false, "Weapon" => false, "Sense of vision1" => true, "Article" => false},
    "A1" => {"a1" => true, "b" => false, "c" => false, "d" => false},
    "B1" => {"a" => false, "b1" => true, "c" => false, "d" => false},
     "C1" => {"a" => false, "b" => false, "c1" => true, "d" => false},
     "D1" => {"a" => false, "b" => false, "c" => false, "d1" => true},
    "pen2" => {"Tool to write2" => true, "Tool to read" => false, "Tool to sketch" => false, "Tool to cook" => false},
    "color2" => {"Tool" => false, "Weapon" => false, "Sense of vision2" => true, "Article" => false},
    "A2" => {"a2" => true, "b" => false, "c" => false, "d" => false},
    "B2" => {"a" => false, "b2" => true, "c" => false, "d" => false},
    "C2" => {"a" => false, "b" => false, "c2" => true, "d" => false},
    "D2" => {"a" => false, "b" => false, "c" => false, "d2" => true},
    "pen3" => {"Tool to write3" => true, "Tool to read" => false, "Tool to sketch" => false, "Tool to cook" => false},
    "color3" => {"Tool" => false, "Weapon" => false, "Sense of vision3" => true, "Article" => false},

    #"A3" => {"a3" => true, "b" => false, "c" => false, "d" => false},
    #"B3" => {"a" => false, "b3" => true, "c" => false, "d" => false},
    # "C" => {"a" => false, "b" => false, "c" => true, "d" => false},
    # "D" => {"a" => false, "b" => false, "c" => false, "d" => true},
}

wq.each do |wrd, wns|
  word = Category.find(2).words.create(content: wrd)
  wns.each do |i ,j|
    word.word_answers.create(content: i, correct: j)
  end
end

#@lsn = User.find_by(email: "admin@example.org").lessons.create(category_id: 2)

#1.upto(4) { |x| @lsn.lesson_words.create lesson_id: @lsn.id, word_id: Word.find(x).id, word_answer_id: WordAnswer.find(4*x).id }

#@lsn.word_answers << [@lsn.words.first.word_answers.find_by(content: "Tool to read")]
#@lsn.word_answers << [@lsn.words.second.word_answers.find_by(content: "Sense of vision")]
#lsn = User.first.lessons.create category_id: 2
#lsn.words << [Word.first, Word.second]


# Following relationships
# users = User.all
# user = users.first
# following = users[2..50]
# followers = users[3..40]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }