Given(/^I am on the home page$/) do
  visit new_search_path
end

Given(/^I fill in "(.*?)"  with "(.*?)"$/) do |arg1, arg2|
  fill_in('search', :with => 'Drake')
end

When(/^I press "(.*?)"$/) do |arg1|
  click_button('submit') 
end

Then(/^I should see search results$/) do
  page.has_content?('table')
end
