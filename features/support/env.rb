require 'selenium-webdriver'
require 'cucumber'
require 'watir'
require 'page-object'
require_relative 'helper_methods'

ENV['BROWSER_TYPE'] ||= 'firefox'
ENV['PATH']

World PageObject::PageFactory