# frozen_string_literal: true

require_relative 'classes/99_product'
require_relative 'classes/99_book'
require_relative 'classes/99_movie'

matrix = Movie.new(price: '35', count: 10)

puts "Movie Matrix is $#{matrix.price}"
