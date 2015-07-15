# family_tree

##To run locally
From the command line:
  1. git clone https://github.com/whitfieldc/family_tree.git
  2. cd family_tree
  3. bundle install

To run all methods:
  * ruby app/runner.rb

To find grandparent of NAME:
  * ruby app/runner.rb grandparent NAME

To find people with no siblings:
  * ruby app/runner.rb lonely

To find people with no children:
  * ruby app/runner.rb childless

To find the person with the most grandchildren:
  * ruby app/runner.rb proudest

To run tests:
  * bundle exec rspec
