Rspec vs Minitest vs Cucumber
============================
Compare the performance of:
* [Rspec](http://rspec.info/)
* [Minitest](https://github.com/seattlerb/minitest)
* [Cucumber](https://cucumber.io/)
* [Test-Bench](http://test-bench.software/)

My Results (2021)
----------
### [Ruby 3.0](https://github.com/MichaelSp/rspec_vs_minitest_vs_cucumber/runs/1897674069?check_suite_focus=true#step:4:1)

```bash
$ bundle exec ruby ./compare.rb
                 user     system      total        real
cucumber:   585.035884  22.566803  607.602687 ( 608.237973)
minitest:    18.208514   7.893526   26.102040 (  26.430622)
rspec:     2406.162561  12.497706 2418.660267 (2418.889164)
test_bench:  29.517226   8.272563   37.789789 (  38.133189)
```
### [Ruby 2.7](https://github.com/MichaelSp/rspec_vs_minitest_vs_cucumber/runs/1897674056?check_suite_focus=true#step:4:1)
```bash
$ bundle exec ruby ./compare.rb
                 user     system      total        real
cucumber:   609.940791  22.444036  632.384827 ( 632.617040)
minitest:    17.570423   7.825259   25.395682 (  25.692178)
rspec:     2354.763935  11.834844 2366.598779 (2366.766677)
test_bench:  32.259550   8.150808   40.410358 (  40.712839)
```

### [Ruby 2.6](https://github.com/MichaelSp/rspec_vs_minitest_vs_cucumber/runs/1897674050?check_suite_focus=true#step:4:1)
```bash
$ bundle exec ruby ./compare.rb
                 user     system      total        real
cucumber:  595.237425  23.425310  618.662735 ( 619.132716)
minitest:   18.058032   8.398094   26.456126 (  26.830221)
rspec:    2876.319241  15.381610 2891.700851 (2891.977532)
test_bench: 33.081621   9.381987   42.463608 (  43.007690)
```

My Results (2020)
----------
````bash
$ ruby compare.rb                                                                                                                                                           
                 user     system      total        real
cucumber:   591.710177 168.260276  759.970453  (762.636717)
minitest:    55.275738  58.717117  113.992855  (114.333114)
rspec:     3052.854860 106.493156 3159.348016 (3166.953538)
````
	
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
cucumber:  129.250000  99.400000 228.650000 (397.114944)
minitest:    0.290000   9.100000   9.390000 ( 20.434662)
rspec:      53.560000   8.290000  61.850000 ( 78.028591)
```
	
Rspec
-------
```ruby
require 'rspec/core'
require 'rspec/expectations'
require 'rspec/autorun'

RSpec.describe "Truth" do
  it 'is expected be true' do
    expect(true).to eq true
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

Test Bench
----------
```ruby
require 'test_bench'

TestBench.output = []

TestBench.context "Truth" do
  test "if it is true" do
    assert(true)
  end
end
```

### truth.feature
```
Feature: Truth
  In order to demonstrate cucumber
  I want to test for truthiness

  Scenario: Test the truth
    Given I have a true-value
    Then It should be true
```

### my_steps.rb
```ruby
Given(/^I have a true\-value$/) do
  @value = true
end

Then(/^It should be true$/) do
  expect(@value).to eq(true)
end
```
