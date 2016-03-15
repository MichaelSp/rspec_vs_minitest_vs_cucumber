require "benchmark"
ENV["RAILS_ENV"] = 'test'

few = 100_000
Benchmark.bm(10) do |x|
  x.report("cucumber:") { few.times{ load 'bench_cucumber.rb' } }
  x.report("minitest:") { few.times { load 'bench_minitest.rb' } }
  x.report("rspec:") { few.times{ load 'bench_rspec.rb' } }
end
