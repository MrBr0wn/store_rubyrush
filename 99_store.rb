# frozen_string_literal: true

require_relative 'classes/99_product'
require_relative 'classes/99_book'
require_relative 'classes/99_movie'

# Creating objects
matrix = Movie.new(
  title: '"Matrix"',
  year_release: '1993',
  director: 'Br. Wachowski',
  price: '$35',
  count: 10
)

annihilation = Movie.new(
  title: '"Annihilation"',
  year_release: '2018',
  director: 'Alex Garland',
  price: '$50',
  count: 5
)

fate = Book.new(
  title: '"Судьба по книге перемен"',
  year_release: '2022',
  author: 'Татьяна Устинова',
  genre: 'Современные детективы',
  price: '$5',
  count: 50
)

rich_dad = Book.new(
  title: '"Богатый папа, бедный папа"',
  year_release: '2011',
  author: 'Роберт Кийосаки',
  genre: 'Просто о бизнесе',
  price: '$8',
  count: 100
)

# Printing objects
matrix.to_s
puts "\n"

annihilation.to_s
puts "\n"

annihilation.update({ title: 'test' })
annihilation.to_s
puts "\n"

fate.to_s
puts "\n"

rich_dad.to_s
puts "\n"

# Updating object
rich_dad.update({ genre: 'dramma', count: 1 })
rich_dad.to_s

# Creating object with static method from_file
movie = Movie.from_file('./data/movies/01.txt')
# Demonstration error
movie = Product.from_file('./data/movies/01.txt')
