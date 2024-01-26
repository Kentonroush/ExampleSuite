require_relative 'basePage'

class Homepage < BasePage

  # The best way to identify an element, bar none, is an ID.
  # And besides, it's good practice to include IDs in development- Any functional element should have one, at the least
  # But as we don't live in a perfect world, other identifiers need to be fallen back on.
  # Lacking a unique ID, as in this test page, we can fall back on a number of options.

  # Text is a decent option, if it's reliably unique across the page, but often it isn't.
  link(:ab_testing_link, text: 'A/B Testing')

  # Href links are reliable and almost always unique, and are what we'll use for most of this page
  # Obviously, while a good option, this is no use for anything that isn't a link
  link(:add_remove_elements_link, href: '/add_remove_elements/')

  # If all else fails, xpath locators are an extremely powerful, flexible fallback option that can locate any element.
  # However, xpath locators are often very fragile, resulting in tests breaking and needing updates far more often.
  link(:basic_auth_link, xpath: '//div[@id="content"]/ul/li[2]/a')

  link(:geolocation_link, href: '/geolocation')

  # Overriding this method allows all URL-related functionality to work without needing to rewrite it
  def page_url
    "https://the-internet.herokuapp.com"
  end

  # Almost all of this page is navigation links. We could create a method for each, but it makes more sense to do this
  def click_link(link_name)
    case link_name
    when "A/B Testing"
      ab_testing_link_element.click
    when "Add/Remove Elements"
      add_remove_elements_link_element.click
    when "Basic Auth"
      basic_auth_link_element.click
    when "Geolocation"
      geolocation_link_element.click
    else
      # This shouldn't ever happen, but if it does, we want to know about it, so raise an error to fail the test
      raise("Cannot navigate to unknown link #{link_name}")
    end
  end

end
