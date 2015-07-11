require 'rspec'
require_relative '../app/person'
require_relative '../app/family'
require_relative '../app/helpers'

describe Family do
  let (:nancy) { Person.new({name: "Nancy"}) }

  it 'can be initialized with a Person-class object' do
    expect{fam = Family.new(nancy)}.not_to raise_error
  end

  it 'cannot be initialized with a non-Person object' do
    tom = Array.new(3)
    expect{fam = Family.new(tom)}.to raise_error(StandardError)
  end

  it 'has an ancestor attribute' do
    fam = Family.new(nancy)
    expect(fam).to respond_to(:ancestor)
  end

  it 'yields a Person object from ancestor attribute' do
    fam = Family.new(nancy)
    expect(fam.ancestor).to be_a(Person)
  end

  describe '#find_only_children' do
    let(:tina) {Person.new({name: "Tina", children: [make_person("Adam")]})}
    let(:john) {Person.new({name: "John", children: [tina, make_person("Amy")]})}
    let(:fam_one) {Family.new(john)}

    it 'prints people with no siblings' do
      expect {fam_one.find_only_children}.to output("The following people have no siblings: John Adam \n").to_stdout
    end

  end

end