# frozen_string_literal: true

require 'rexml/document'
require 'date'

current_path = File.dirname(__FILE__)
file_name = "#{current_path}/data/products.xml"
not_found_msg = 'File "/data/products.xml" not found'

# Const for products parameters
# Freeze this for deny change
BOOK_PARAMS = {
  title: 'Title',
  author: 'Author',
  genre: 'Genre',
  price: 'Price',
  count: 'Count'
}.freeze

MOVIE_PARAMS = {
  title: 'Title',
  year_release: 'Year of release',
  director: 'Director',
  price: 'Price',
  count: 'Count'
}.freeze

params = {}

# Checking XML-file
abort not_found_msg unless File.exist?(file_name)
file = File.read(file_name)

# XML-file validation check
begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  abort "\n\n\t\t*** FATAL ERROR!!!! ***\n\n#{e.message}"
end

puts "\n\t***Helper for writing Products to the XML-file***\n\n"

puts 'Choice type of Product'
puts "\t1: Book\n\t2: Movie"
product_type = $stdin.gets.chomp.to_i

abort 'Incorrect number!' if product_type < 1 && product_type > 2

case product_type
when 1
  product_type = 'book'
  BOOK_PARAMS.each do |key, value|
    puts "Input #{value} of #{product_type}:"
    params[key] = $stdin.gets.chomp
  end
when 2
  product_type = 'movie'
  MOVIE_PARAMS.each do |key, value|
    puts "Input #{value} of #{product_type}:"
    params[key] = $stdin.gets.chomp
  end
else
  abort 'Incorrect number!'
end

# Preparing data for writing to the file
products = doc.elements.find('products').first
product = products.add_element 'product', {
  'price' => params[:price],
  'count' => params[:count]
}

params.delete(:price)
params.delete(:count)
# Convert hash params with sybol-keys to string-keys for .add_element
attributes = {}
params.map { |key, value| attributes[key.to_s] = value }
product = product.add_element product_type.to_s, attributes

# Writing to the file
file = File.new(file_name, 'w')
doc.write(file, 2)
file.close

puts "\n\t***Recorded successfully***"
