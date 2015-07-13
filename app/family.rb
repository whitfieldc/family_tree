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

  def fpg_recursive(root, score=nil, leader=[])
    candidate = root
    high_score = score || 1
    kids = candidate.children
    return if kids.length == 0
    g_kids = 0
    kids.each do |kid|
      g_kids += (kid.children).length
    end
    return if g_kids == 0
    if g_kids == high_score
      leader.push(candidate)
    elsif g_kids > high_score
      high_score = g_kids
      leader = [candidate]
    end
    score_and_leader = [high_score, leader]
    next_gen = kids.map do |kid|
      fpg_recursive(kid, high_score, leader)
    end
    next_gen.each do |sub_winner_array|
      if sub_winner_array && (sub_winner_array[0] > high_score)
        score_and_leader = sub_winner_array
      end
    end
    return score_and_leader
  end

  def find_proudest_grandparent
    winner_array = fpg_recursive(self.ancestor)
    if winner_array
      winner_array[1].each do |winner|
        puts winner.name
      end
    end
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

  # def find_proudest_grandparent_recursive(root)
  #   kids = root.children
  #   return if kids.length == 0
  #   total = 0
  #   kids.each do |child|
  #     total += (child.children).length
  #   end
  #   return if total == 0
  #   if total > winning_grandkids
  #     winning_grandkids = total
  #     winner = [root]
  #   elsif total == winning_grandkids
  #     winner.push(root)
  #   end
  #   kids.each do |child|
  #     find_proudest_grandparent_recursive(child)
  #   end
  # end

end