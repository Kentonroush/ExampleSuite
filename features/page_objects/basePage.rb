class BasePage
  include PageObject


  # Override this to enable url-based actions for a page.
  # Can be left alone if these aren't needed
  def page_url
    "default.com"
  end

  # Unlikely to see much use in a real application, as most navigation should be done via page clicks instead
  # But useful as a clean starting point for tests
  def goto_page
    @browser.get(page_url)
  end

  def current_page?
    # We use a regex here to ignore any parameters in the URL that might throw our tests off, as well as the trialing /
    # In the less common case that this data is needed, a poge object can simply override this
    !(browser.current_url =~ /#{page_url}\/?(\?(.*))?/).nil?
  end
end