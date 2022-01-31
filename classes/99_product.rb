# frozen_string_literal: true

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
  end
end
