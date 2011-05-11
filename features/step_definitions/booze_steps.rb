Given /^the following boozes:$/ do |boozes|
  Booze.create!(boozes.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) booze$/ do |pos|
  visit boozes_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following boozes:$/ do |expected_boozes_table|
  expected_boozes_table.diff!(tableish('table tr', 'td,th'))
end
