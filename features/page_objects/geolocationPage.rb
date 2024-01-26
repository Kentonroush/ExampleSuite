require_relative 'basePage'

class GeolocationPage < BasePage

  # This one has an ID! Rare in this test site.
  paragraph(:geolocation_output_area, id: 'demo')

  # Strictly speaking, no identifier at all is needed here, as it's the only button on the page.
  # That's bad practice though, so we'll use its text instead.
  button(:request_geolocation_button)

  def page_url
    "https://the-internet.herokuapp.com/geolocation"
  end

  def click_geolocation_button
    request_geolocation_button_element.click
  end

  # There's a few ways to handle this, but my preference is to keep as much functional code as possible
  # here in the page object, so that the step definitions don't need to know anything about how the page is structured.
  # So, we'll parse the geolocation text here into something the steps can use directly.
  def get_geolocation
    words = geolocation_output_area.split

    # We could simply hard-code these to indexes 1 and 3, but this method isn't for validating the page's formatting
    # so we do a simple parse and search to make sure the results will be returned even if there are unrelated tweaks
    x = words[words.find_index("Latitude:")+1]
    y = words[words.find_index("Longitude:")+1]
    [x, y]
  end
end
