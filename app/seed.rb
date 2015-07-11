require_relative 'person'
require_relative 'family'
require_relative 'helpers'


george = Person.new({name: "George", children: [make_person("Patrick"), make_person("Robert")]})

james = Person.new({name: "James", children: [make_person("Mary")]})

kevin = Person.new({name: "Kevin", children: [make_person("Samuel"), george, james, make_person("Aaron")]})

jill = Person.new({name: "Jill", children: [kevin]})

carl = Person.new({name: "Carl", children: [make_person("Catherine"), make_person("Joseph")]})

nancy = Person.new({name: "Nancy", children: [make_person("Adam"), jill, carl]})

@fam = Family.new(nancy)





