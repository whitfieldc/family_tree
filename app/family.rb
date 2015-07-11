class Family
  attr_reader :ancestor
  def initialize(root_person)
    if root_person.is_a?(Person)
      @ancestor = root_person
    else
      raise 'The family founder must be a Person.'
    end
  end

  def find_grandparent(grandchild_name)
  end

  def find_only_children
    singletons = find_only_children_recursive(self.ancestor)
    singletons.unshift(self.ancestor)
    #ancestor may or may not be an only child
    #but IS only known member of his/her generation
    result = "The following people have no siblings: "
    singletons.each do |person|
      result += (person.name + " ")
    end
    puts result
  end

  def find_non_parents
  end

  def find_proudest_grandparent
  end

  private

  def find_only_children_recursive(root)
    children = []
    num_of_kids = (root.children).length
    if num_of_kids == 1
      singleton = root.children[0]
      children.push([singleton] + find_only_children_recursive(singleton))
    elsif num_of_kids > 1
      next_gen = (root.children).map do |child|
        find_only_children_recursive(child)
      end
      children.push(next_gen.flatten)
    end
    return children.flatten
  end

end