require 'pathname'

class ProductCollection
  # Returned array of products
  def to_a
    # TODO:
  end

  # Sorted products
  def sort(products, direction)
    # TODO:
  end

  # Opened products directory
  class << self
    def from_dir
      current_path = current_path = Pathname.new(__FILE__)
      dir_data = current_path.realpath.parent.parent + 'data'

      puts dir_data
    end
  end
end
