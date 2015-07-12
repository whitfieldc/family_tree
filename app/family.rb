class Family
  attr_reader :ancestor
  def initialize(root_person)
    if root_person.is_a?(Person)
      @ancestor = root_person
    else
      raise 'The family founder must be a Person.'
    end
  end

  def find_grandparent(grandchild_name, parent=nil, grandparent=nil)
    if !parent
      find_grandparent(grandchild_name, self.ancestor)
    else
      kids = parent.children
      if kids.length == 0
        kids
      else
        kid_name_array = kids.map{|child| child.name}
        if grandparent && (kid_name_array.include?(grandchild_name))
          puts grandparent.name
          [grandparent]
        else
          next_gen = kids.map{|child|
            find_grandparent(grandchild_name, child, parent)
          }
          next_gen.flatten
        end
      end
    end
  end

  def find_only_children
    singletons = find_only_children_recursive(self.ancestor)
    singletons.unshift(self.ancestor)
    #ancestor may or may not be an only child
    #but IS only known member of his/her generation
    singletons.each do |person|
      puts person.name
    end
  end

  def find_non_parents
    no_kids = find_non_parents_recursive(self.ancestor)
    no_kids.each do |person|
      puts person.name
    end
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
    children.flatten
  end

  def find_non_parents_recursive(root)
    childless = []
    num_of_kids = (root.children).length
    if num_of_kids == 0
      childless.push(root)
    else
      next_gen = (root.children).map do |child|
        find_non_parents_recursive(child)
      end
      childless.push(next_gen.flatten)
    end
    childless.flatten
  end

end