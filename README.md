Rspec vs Minitest vs Cucumber
============================
Compare the performance of:
* Rspec
* Minitest
* Cucumber
	
My Results (2016)
----------
```bash
$ ruby compare.rb
                user     system      total        real
cucumber:  322.370000  17.200000  339.570000  (339.631249)
minitest:    7.050000   3.190000   10.240000  ( 10.243859)
rspec:    3481.360000  11.540000 3492.900000 (3493.590699)
```
	
My Results (2015)
----------
```bash
$ ruby compare.rb
                 user     system      total        real
minitest:    0.290000   9.100000   9.390000 ( 20.434662)
cucumber:  129.250000  99.400000 228.650000 (397.114944)
rspec:      53.560000   8.290000  61.850000 ( 78.028591)
```
	
Rspec
-------
```ruby
require 'rspec'

RSpec.describe "Truth" do
  it 'should be true' do
    true.should == true
  end
end
```

Minitest
--------
```ruby
require 'minitest/autorun'

class TruthTest < Minitest::Test
  def test_truth
    assert true
  end
end
```

Cucumber
--------
```ruby
require 'cucumber/cli/main'

buffer = StringIO.new
configuration = Cucumber::Cli::Configuration.new(buffer, STDERR)
configuration.parse!(['--format','pretty','--strict','features'])
Cucumber.logger = configuration.log

runtime = Cucumber::Runtime.new(configuration)
runtime.run!
```

truth.feature
```
Feature: Truth
  In order to demonstrate cucumber
  I want to test for truthiness

  Scenario: Test the truth
    Given I have a true-value
    Then It should be true
```

my_steps.rb
```ruby
Given(/^I have a true\-value$/) do
  @value = true
end

Then(/^It should be true$/) do
  expect(@value).to eq(true)
end
```
