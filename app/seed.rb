require_relative 'person'
require_relative 'family'

def make_person(name)
  Person.new({name: name})
end

def make_family(parent, kid_array)
  parent = make_person(parent)
  kid_array.each {|kid| parent.add_child(make_person(kid))}

end

george = make_person("George")

["Patrick", "Robert"].each {|kid| george.add_child(make_person(kid))}

james = make_person("James")

james.add_child(make_person("Mary"))

kev = make_person("Kevin")

[make_person("Samuel"), george, james, make_person("Aaron")].each {|kid| kev.add_child(kid)}

carl = make_person("Carl")

["Catherine", "Joseph"].each {|kid| carl.add_child(make_person(kid))}

jill = make_person("Jill")
jill.add_child(kev)

nancy = make_person("Nancy")
first_gen = [make_person("Adam"), jill, carl]
first_gen.each {|kid| nancy.add_child(kid)}

@fam = Family.new(nancy)



