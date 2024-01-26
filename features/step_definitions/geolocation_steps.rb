When(/^I set my geolocation to "(\d+)", "(\d+)"$/) do |x, y|
  set_geolocation(x, y)
end

When(/^I click the geolocation "Where am I\?" button$/) do
  visit_page(GeolocationPage).click_geolocation_button
end

Then(/^my geolocation should be displayed as "(\d+)", "(\d+)"$/) do |x, y|
  location = visit_page(GeolocationPage).get_geolocation
  expect(location[0]).to eq(x.to_s), "Expected latitude to be #{x} but got #{location[0]}"
  expect(location[1]).to eq(y.to_s), "Expected longitude to be #{y} but got #{location[1]}"
end