# frozen_string_literal: true

require 'rexml/document'

# Parent class for the store
class Product
  attr_accessor :params

  # Const for products parameters
  # Freeze this for deny change
  PRODUCT_PARAMS = {
    title: 'Title',
    year_release: 'Year of release',
    director: 'Director',
    author: 'Author',
    genre: 'Genre',
    price: 'Price',
    count: 'Count'
  }.freeze

  def initialize(params)
    @params = params
  end

  # Method print content of the instance
  def to_s(*)
    str = ''
    @params.each do |k, v|
      str += "#{PRODUCT_PARAMS[k]}: #{v}, "
    end
    puts str.strip.chop
  end

  # Method update parameters instance
  def update(params)
    params.map { |key, value| @params[key] = value }
  end

  # Method of Product class
  # raise NotImplementedError if instance trying create
  class << self
    def from_file(path)
      raise NotImplementedError
    end

    def read_from_xml(file_name)
      # building full path to the xml-file
      doc = open_xml(file_name)
      doc.elements.each('products/product') do |product|
        # Printing all Books
        print_book(product)

        # Printing all movies
        print_movie(product)
      end
    end

    private

    # Getting xml-file as object
    def open_xml(path)
      current_path = Pathname.new(__FILE__)
      xml_file = current_path.realpath.parent.parent + "data/#{path}"

      abort 'File not found' unless File.exist?(xml_file)

      xml_file = File.read(xml_file)
      REXML::Document.new(xml_file)
    end

    # Printing item of book or movie
    def print_item(params)
      params.each do |key, value|
        puts "#{key}: #{value}"
      end
      puts "\n"
    end

    # Printing all Books via print_item
    def print_book(book_obj)
      book_obj.elements.each('book') do |book|
        next if book.to_s.nil?

        print_item({
                     PRODUCT_PARAMS[:title] => book.attributes['title'],
                     PRODUCT_PARAMS[:author] => book.attributes['author'],
                     PRODUCT_PARAMS[:price] => book_obj.attributes['price'],
                     PRODUCT_PARAMS[:count] => book_obj.attributes['count']
                   })
      end
    end

    # Printing all Movies via print_item
    def print_movie(movie_obj)
      movie_obj.elements.each('movie') do |movie|
        next if movie.to_s.nil?

        print_item({
                     PRODUCT_PARAMS[:title] => movie.attributes['title'],
                     PRODUCT_PARAMS[:director] => movie.attributes['director'],
                     PRODUCT_PARAMS[:year_release] => movie.attributes['year_release'],
                     PRODUCT_PARAMS[:price] => movie_obj.attributes['price'],
                     PRODUCT_PARAMS[:count] => movie_obj.attributes['count']
                   })
      end
    end
  end
end
