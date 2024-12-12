# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'


# Удаляем существующие данные 
User .destroy_all
Category.destroy_all
Test.destroy_all
Question.destroy_all
Answer.destroy_all

# Создаем пользователей
users = User.create([
  { name: Faker::Name.first_name, email: Faker::Internet.email },
  { name: Faker::Name.first_name, email: Faker::Internet.email },
  { name: Faker::Name.first_name, email: Faker::Internet.email }
])

# Создаем категории
categories = Category.create!([
  { title: "Backend" },
  { title: "Frontend" },
  { title: "ML" }
])

# Создаем тесты
tests = Test.create!([
  { title: 'Ruby on Rails Test', level: 2, category_id: categories[0].id, author_id: users[0].id },
  { title: 'JavaScript Basics Test', level: 1, category_id: categories[1].id, author_id: users[1].id },
  { title: 'Machine Learning', level: 3, category_id: categories[2].id, author_id: users[2].id }
])

# Создаем вопросы
questions = Question.create!([
  { body: 'What is Rails?', test_id: tests[0].id },
  { body: 'What does DOM stand for?', test_id: tests[1].id },
  { body: 'What is overfitting in ML?', test_id: tests[2].id }
])

# Создаем ответы
answers = Answer.create!([
  { body: 'A web application framework', correct: true, question_id: questions[0].id },
  { body: 'A type of database', correct: false, question_id: questions[0].id },
  { body: 'Document Object Model', correct: true, question_id: questions[1].id },
  { body: 'Data Object Model', correct: false, question_id: questions[1].id },
  { body: 'When a model learns too much from the training data', correct: true, question_id: questions[2].id },
  { body: 'When a model learns too little from the training data', correct: false, question_id: questions[2].id }
])

puts "Создано #{User .count} пользователей"
puts "Создано #{Category.count} категорий"
puts "Создано #{Test.count} тестов"
puts "Создано #{Question.count} вопросов"
puts "Создано #{Answer.count} ответов"
