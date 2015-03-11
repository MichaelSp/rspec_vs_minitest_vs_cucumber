require "benchmark"
ENV["RAILS_ENV"] = 'test'

times = 10
Benchmark.bm(10) do |x|
  x.report("cucumber:") { (1..times).each { load 'bench_cucumber.rb' } }
  x.report("minitest:") { (1..times).each { load 'bench_minitest.rb' } }
  x.report("rspec:") { (1..times).each { load 'bench_rspec.rb' } }
end