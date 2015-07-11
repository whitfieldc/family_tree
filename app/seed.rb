require_relative 'person'
require_relative 'family'
require_relative 'helpers'

george_line = make_family("George", ["Patrick", "Robert"])
george = george_line.ancestor

james_line = make_family("James", ["Mary"])
james = james_line.ancestor

kevin_line = make_family("Kevin", ["Samuel", george, james, "Aaron"])
kevin = kevin_line.ancestor

jill_line = make_family("Jill", [kevin])
jill = jill_line.ancestor

carl_line = make_family("Carl", ["Catherine", "Joseph"])
carl = carl_line.ancestor

@fam = make_family("Nancy", ["Adam", jill, carl])
nancy = @fam.ancestor





