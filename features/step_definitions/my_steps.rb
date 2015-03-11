Given(/^I have a true\-value$/) do
  @value = true
end

Then(/^It should be true$/) do
  expect(@value).to eq(true)
end