# Direct URL navigation is generally rare within modern apps, but you have to start the test somehow.
When(/^I navigate to test site$/) do
  visit_page(Homepage) do |page|
    page.goto_page
  end
end

When(/^I click the homepage "(.*)" link$/) do |link_name|
  visit_page(Homepage) do |page|
    page.click_link(link_name)
  end
end

# A single generic step here is much easier to maintain than potentially dozens of individual steps
# It can be a tradeoff though, and in a larger application, it's generally best to make steps much more specific
# Otherwise the scenarios might get harder to read over time, as similarly named steps become insufficiently clear
Then(/^I should be on the "(.*)" page$/) do |page_name|
  puts(@browser.current_url)
  case page_name
  when "Home"
    expect(visit_page(Homepage).current_page?). to be true
  when "A/B Testing"
    expect(visit_page(ABTestPage).current_page?). to be true
  when "Add/Remove Elements"
    expect(visit_page(AddRemoveElementsPage).current_page?). to be true
  when "Geolocation"
    expect(visit_page(GeolocationPage).current_page?). to be true
  else
    raise("Page #{page_name} is not known, ")
  end
end