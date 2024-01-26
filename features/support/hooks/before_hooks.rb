Before do
  case ENV['BROWSER_TYPE']
  when "firefox"
    @browser = Selenium::WebDriver.for :firefox
  else
    raise("Error, #{ENV['BROWSER_TYPE']} is not a supported browser type")
  end
end

After do
  @browser.quit
end