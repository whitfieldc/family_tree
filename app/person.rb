class Person
  attr_reader :name
  attr_accessor :children

  def initialize(info)
    @name = info[:name]
    @children = info[:children].to_a
  end

  def add_child(child)
    if child.is_a?(Person)
      if @children
        @children.push(child)
      else
        @children = child.to_a
      end
    else
      raise 'This parent can only accept human children'
    end
  end

end
