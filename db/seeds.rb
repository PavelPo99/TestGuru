admin = User.find_or_initialize_by(email: 'petr2000pw@gmail.com')
admin.update!(
  type: 'Admin'
)

categories = Category.create!([
  { title: "Backend" },
  { title: "Frontend" },
  { title: "Machine Learning" },
  { title: "DevOps" },
  { title: "Database" }
])

tests = Test.create!([
  { title: 'Ruby', level: 1, category_id: categories[0].id, author_id: Admin.first.id },
  { title: 'Ruby on Rails', level: 2, category_id: categories[0].id, author_id: Admin.first.id },
  { title: 'JavaScript', level: 1, category_id: categories[1].id, author_id: Admin.first.id },
  { title: 'Docker', level: 3, category_id: categories[2].id, author_id: Admin.first.id },
  { title: 'HTML & CSS', level: 2, category_id: categories[1].id, author_id: Admin.first.id },
  { title: 'PostgreSQL', level: 3, category_id: categories[2].id, author_id: Admin.first.id }
])


  ruby_basics = tests[0]
  q1 = Question.create!(
    body: 'What is the output of: puts "hello".capitalize',
    test: ruby_basics
  )
  Answer.create!([
    { body: 'Hello', correct: true, question: q1 },
    { body: 'hello', correct: false, question: q1 },
    { body: 'HELLO', correct: false, question: q1 }
  ])

  q2 = Question.create!(
    body: 'Which is NOT a valid Ruby data type?',
    test: ruby_basics
  )
  Answer.create!([
    { body: 'Symbol', correct: false, question: q2 },
    { body: 'Hash', correct: false, question: q2 },
    { body: 'ArrayList', correct: true, question: q2 }
  ])

  q3 = Question.create!(
    body: 'What does the ||= operator do?',
    test: ruby_basics
  )
  Answer.create!([
    { body: 'Assigns value if variable is nil or false', correct: true, question: q3 },
    { body: 'Performs logical OR operation', correct: false, question: q3 },
    { body: 'Checks for equality', correct: false, question: q3 }
  ])

  rails = tests[1]
  q4 = Question.create!(
    body: 'What is ActiveRecord in Rails?',
    test: rails
  )
  Answer.create!([
    { body: 'ORM (Object-Relational Mapping) layer', correct: true, question: q4 },
    { body: 'Frontend framework', correct: false, question: q4 },
    { body: 'Testing library', correct: false, question: q4 }
  ])

  q5 = Question.create!(
    body: 'Which command generates a model?',
    test: rails
  )
  Answer.create!([
    { body: 'rails generate model ModelName', correct: true, question: q5 },
    { body: 'rails new model ModelName', correct: false, question: q5 },
    { body: 'rails create model ModelName', correct: false, question: q5 }
  ])

  q6 = Question.create!(
    body: 'Where would you define routes in Rails?',
    test: rails
  )
  Answer.create!([
    { body: 'config/routes.rb', correct: true, question: q6 },
    { body: 'app/controllers/routes.rb', correct: false, question: q6 },
    { body: 'db/routes.yml', correct: false, question: q6 }
  ])

  js = tests[2]
  q7 = Question.create!(
    body: 'How do you declare a variable in modern JavaScript?',
    test: js
  )
  Answer.create!([
    { body: 'let or const', correct: true, question: q7 },
    { body: 'var', correct: false, question: q7 },
    { body: 'variable', correct: false, question: q7 }
  ])

  q8 = Question.create!(
    body: 'What is closure in JavaScript?',
    test: js
  )
  Answer.create!([
    { body: 'Function with access to its outer scope', correct: true, question: q8 },
    { body: 'A way to close browser tab', correct: false, question: q8 },
    { body: 'End of code block marker', correct: false, question: q8 }
  ])

  q9 = Question.create!(
    body: 'Which method adds an element to array end?',
    test: js
  )
  Answer.create!([
    { body: 'push()', correct: true, question: q9 },
    { body: 'pop()', correct: false, question: q9 },
    { body: 'shift()', correct: false, question: q9 }
  ])

  docker = tests[3]
  q10 = Question.create!(
    body: 'What is Docker?',
    test: docker
  )
  Answer.create!([
    { body: 'Containerization platform', correct: true, question: q10 },
    { body: 'Virtual machine manager', correct: false, question: q10 },
    { body: 'Cloud storage service', correct: false, question: q10 }
  ])

  q11 = Question.create!(
    body: 'Which command builds a Docker image?',
    test: docker
  )
  Answer.create!([
    { body: 'docker build -t image_name .', correct: true, question: q11 },
    { body: 'docker create image_name', correct: false, question: q11 },
    { body: 'docker run image_name', correct: false, question: q11 }
  ])

  q12 = Question.create!(
    body: 'What is Docker Compose used for?',
    test: docker
  )
  Answer.create!([
    { body: 'Managing multi-container applications', correct: true, question: q12 },
    { body: 'Composing Dockerfiles', correct: false, question: q12 },
    { body: 'Compressing Docker images', correct: false, question: q12 }
  ])


  html_css = tests[4]
  q13 = Question.create!(
    body: 'Which HTML5 tag is for navigation?',
    test: html_css
  )
  Answer.create!([
    { body: '<nav>', correct: true, question: q13 },
    { body: '<navigate>', correct: false, question: q13 },
    { body: '<navigation>', correct: false, question: q13 }
  ])

  q14 = Question.create!(
    body: 'How do you select elements by class in CSS?',
    test: html_css
  )
  Answer.create!([
    { body: '.class-name', correct: true, question: q14 },
    { body: '#class-name', correct: false, question: q14 },
    { body: 'class:name', correct: false, question: q14 }
  ])

  q15 = Question.create!(
    body: 'What does CSS stand for?',
    test: html_css
  )
  Answer.create!([
    { body: 'Cascading Style Sheets', correct: true, question: q15 },
    { body: 'Computer Style Sheets', correct: false, question: q15 },
    { body: 'Creative Style System', correct: false, question: q15 }
  ])

  postgres = tests[5]
  q16 = Question.create!(
    body: 'Which command connects to PostgreSQL?',
    test: postgres
  )
  Answer.create!([
    { body: 'psql -U username -d database', correct: true, question: q16 },
    { body: 'postgres connect', correct: false, question: q16 },
    { body: 'pg_connect', correct: false, question: q16 }
  ])

  q17 = Question.create!(
    body: 'How do you create a table in PostgreSQL?',
    test: postgres
  )
  Answer.create!([
    { body: 'CREATE TABLE table_name (column1 datatype, ...);', correct: true, question: q17 },
    { body: 'NEW TABLE table_name (column1 datatype, ...);', correct: false, question: q17 },
    { body: 'ADD TABLE table_name (column1 datatype, ...);', correct: false, question: q17 }
  ])

  q18 = Question.create!(
    body: 'What is the purpose of pg_dump?',
    test: postgres
  )
  Answer.create!([
    { body: 'To create database backups', correct: true, question: q18 },
    { body: 'To delete databases', correct: false, question: q18 },
    { body: 'To optimize queries', correct: false, question: q18 }
  ])
