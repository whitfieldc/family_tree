require 'rspec'
require_relative '../app/person'

describe Person do
  let (:jill) { Person.new({name: "Jill"}) }
  let (:nancy) { Person.new({name: "Nancy"}) }

  it "can be initialized with a name" do
    expect(nancy.name).to eq("Nancy")
  end

  it "has a children attribute" do
    expect(nancy).to respond_to(:children)
  end

  it "has no children by default" do
    expect(nancy.children).to be_empty
  end

  it "has an add_child method" do
    expect(nancy).to respond_to(:add_child)
  end

  it "can accept a new child" do
    expect{nancy.add_child(jill)}.to change{nancy.children.length}.from(0).to(1)
  end

  it "rejects a non-human child" do
    pinocchio = Hash.new({arms: "wooden"})
    expect{nancy.add_child(pinocchio)}.to raise_error(StandardError)
  end

  it "retrieves children with children attribute" do
    nancy.add_child(jill)
    expect(nancy.children).to eq([jill])
  end

  it "can have grandchildren" do
    nancy.add_child(jill)
    jill.add_child(Person.new({name: "Tom"}))
    expect(nancy.children[0].children).not_to be_nil
  end

end