require_relative "classes/99_product.rb"
require_relative "classes/99_book.rb"
require_relative "classes/99_movie.rb"


matrix = Movie.new(price: "35", count: 10)

puts "Movie Matrix is $#{matrix.price}"
