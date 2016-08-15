class Cart
  attr_reader :contents
  def initialize(initial_contents)
    @contents = initial_contents || []
  end

  def add_power(power)
    contents.push([name: power.name, 
                   cost: power.cost, 
                   image_url: power.image_url])
  end

  def total_items
    contents.count
  end
end
