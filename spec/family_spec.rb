require 'rspec'
require_relative '../app/person'
require_relative '../app/family'
require_relative '../app/helpers'

describe Family do
  let (:nancy) { Person.new({name: "Nancy"}) }
  let(:tina) {Person.new({name: "Tina", children: [make_person("Adam")]})}
  let(:john) {Person.new({name: "John", children: [tina, make_person("Amy")]})}
  let(:fam_one) {Family.new(john)}

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

  describe '#find_grandparent' do

    it 'prints name of grandparent of input' do
      expect {fam_one.find_grandparent("Adam")}.to output("John\n").to_stdout
    end

  end

  describe '#find_only_children' do

    it 'prints names of people with no siblings' do
      expect {fam_one.find_only_children}.to output("John\nAdam\n").to_stdout
    end

  end

  describe '#find_non_parents' do

    it 'prints names of people with no children' do
      expect {fam_one.find_non_parents}.to output("Adam\nAmy\n").to_stdout
    end

  end

  describe '#find_proudest_grandparent' do

    it 'prints the name of the person with the largest number of grandchildren' do
      expect{fam_one.find_proudest_grandparent}.to output("John\n").to_stdout
    end

    it 'prints both names in the case of a tie' do
      tina.children[0].add_child(make_person("Fred"))
      expect{fam_one.find_proudest_grandparent}.to output("John\nTina\n").to_stdout
    end

  end

end