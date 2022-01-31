# frozen_string_literal: true

# Children from Product
class Book < Product
  # Static method for reading parameters from file
  def self.from_file(path)
    content = File.readlines(path).map(&:chomp)

    new(
      PRODUCT_PARAMS[:title] => content[0],
      PRODUCT_PARAMS[:genre] => content[1],
      PRODUCT_PARAMS[:author] => content[2],
      PRODUCT_PARAMS[:price] => content[3],
      PRODUCT_PARAMS[:count] => content[4]
    )
  end
end
