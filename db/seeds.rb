require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

Board.create(
  name: 'Seed',
  email: 'seed@example.com',
  matrix: [[true, false, false], [false, false, true]]
)

11.times do |i|
  BoardForm.new(
    name: "Board #{i + 1}",
    email: "user_#{i + 1}@example.com",
    width: rand(1..i),
    height: rand(1..i),
    mines: i
  ).save
end
