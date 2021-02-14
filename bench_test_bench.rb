require 'test_bench'

TestBench.output = []

TestBench.context "Truth" do
  test "if it is true" do
    assert(true)
  end
end