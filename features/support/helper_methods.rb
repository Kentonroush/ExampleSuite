# Not all commonly used code will cleanly fit into a page object or step definition.
# For that purpose, it's wise to have one or more helper files like this.

# There are 'better' ways to handle faking our geolocation, involving specific APIs
# and configuration settings we could set when creating the browser.
# However, doing it this way serves as both an example of how javascript can be helpful in automation,
# as well as being a single one size fits all solution that will work on multiple browsers.
# Note that this must be run on the page it is to be used on, as it will reset to normal when loading a new page.
def set_geolocation(x_loc, y_loc)
  @browser.execute_script(
    "var x_loc = arguments[0];
    var y_loc = arguments[1];
    window.navigator.geolocation.getCurrentPosition =
      function(success) {
        var position = {
          'coords': {
            'latitude': x_loc,
            'longitude': y_loc,
          }
        };
        success(position);
      }", x_loc, y_loc)
end