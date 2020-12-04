require 'selenium-webdriver'
require 'webdrivers'
require 'rubygems'
driver = Selenium::WebDriver.for :chrome
#Launch browser and Open Google.com
driver.get 'http://google.com'
#Maximize or set size of browser window.
driver.manage.window.maximize
#Get Title of page and print it.
puts "Page title is #{driver.title}"
#Get URL of current page and print it.
puts "URL of current page < #{driver.current_url}>"
#puts driver.page_source
wait = Selenium::WebDriver::Wait.new(:timeout => 55)
# sendkey to searchbar and Search with ‘iTMS Coaching’ word
input = wait.until {
    searchbar = driver.find_element(css: '[name="q"]')
    searchbar if searchbar.displayed?
}
input.send_keys("iTMS Coaching")
input.send_keys :enter
sleep 5
#Get New Title of page and print it
puts "Now page title is #{driver.title}"
sleep 3
driver.quit
driver = Selenium::WebDriver.for :chrome
#Launch browser and Open Google.com
driver.get 'https://itmscoaching.herokuapp.com/form'
#Maximize or set size of browser window.
driver.manage.window.maximize
 wait = Selenium::WebDriver::Wait.new(:timeout => 55)
 # sendkeys ( iTMS) to firstname
 input = wait.until {
     firstname = driver.find_element(css: '[id="first-name"]')
     firstname if firstname.displayed?
 }
 input.send_keys("iTMS")
# sendkeys ( Coaching) to lastname
 input = wait.until {
    lastname = driver.find_element(css: '[id="last-name"]')
    lastname if lastname.displayed?
 }
 input.send_keys("Coaching")
# sendkeys ( QA) to Job
 input = wait.until {
     jobtitle =driver.find_element(css: '[id="job-title"]')
     jobtitle if jobtitle.displayed?
 }
 input.send_keys ("QA")
 #Select Education
 Edu = driver.find_element(css: '[id="radio-button-2"]')
        Edu.click
 #Select Sex
 Sex = driver.find_element(css: '[id="checkbox-2"]')
        Sex.click
 #Select Year of experince
 Exp = driver.find_element(css: '[id="select-menu"]')
        puts Exp.inspect
       select_exp = Selenium::WebDriver::Support::Select.new(Exp)
       select_exp.select_by(:text, "2-4")
 #Date Picker
 Date = driver.find_element(css: '[id="datepicker"]')
       Date.send_keys ("10/27/2025")
 #Submit
      Submit =driver.find_element(xpath: '//a[contains(text(),"Submit")]')
       Submit.click
 sleep 10
 driver.quit
