# frozen_string_literal: true

# Children from Product
class Book < Product
  # Static method for reading parameters from file
  def self.from_file(path)
    # TODO: rescue this action
    file = File.read(path)

    puts file
  end
end
