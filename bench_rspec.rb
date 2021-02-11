require 'rspec/core'
require 'rspec/expectations'
require 'rspec/autorun'

RSpec.describe "Truth" do
  it 'is expected be true' do
    expect(true).to eq true
  end
end
