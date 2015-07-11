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
  end

  def find_non_parents
  end

  def find_proudest_grandparent
  end

end