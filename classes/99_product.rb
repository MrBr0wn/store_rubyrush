# frozen_string_literal: true

# Parent class for the store
class Product
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def to_s
    keys = {
      title: 'Title',
      year_release: 'Year of release',
      director: 'Director',
      author: 'Author',
      genre: 'Genre',
      price: 'Price',
      count: 'Count'
    }
    str = ''
    @params.each do |k, v|
      str += keys[k] + ': ' + v.to_s + ', '
    end
    puts str.strip.chop
  end
end
