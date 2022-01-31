# frozen_string_literal: true

require 'pathname'

# Collection of all products from directory
class ProductCollection
  # Const of all products types
  PRODUCT_TYPES = {
    movie: {
      dir: 'movies',
      class: Movie
    },
    book: {
      dir: 'books',
      class: Book
    }
  }.freeze

  def initialize(products = [])
    @products = products
  end

  # Returned array of products
  def to_a
    @products
  end

  # Sorted products
  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.params[:title] }
    when :price
      @products.sort_by! { |product| product.params[:price] }
    when :count
      @products.sort_by! { |product| product.params[:count] }
    end

    @products.reverse! if params[:order] == :asc

    self
  end

  # Opened products directory
  class << self
    def from_dir(dir_path)
      products = []
      # building full path to the directory
      current_path = Pathname.new(__FILE__)
      dir_data = current_path.realpath.parent.parent + dir_path

      PRODUCT_TYPES.each do |_type, hash|
        product_dir = hash[:dir]
        product_class = hash[:class]

        Dir["#{dir_data}/#{product_dir}/*.txt"].each do |path|
          products << product_class.from_file(path)
        end
      end

      new(products)
    end
  end
end
