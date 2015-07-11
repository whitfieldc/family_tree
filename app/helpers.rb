def make_person(name)
  Person.new({name: name})
end

def make_family(parent, kid_array)
  parent = make_person(parent)
  kid_array.each do |kid|
    if kid.is_a?(Person)
      parent.add_child(kid)
    elsif kid.is_a?(String)
      parent.add_child(make_person(kid))
    end
  end
  Family.new(parent)
end