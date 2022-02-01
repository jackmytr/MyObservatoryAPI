Feature: 9 Day Forecast
  Description: This feature tests 9 Day Forecast API functions


  Background:
    #Read karate-config.js for URL setting
    * call read('classpath:karate-config.js')
    #Define a variable and assign the read URL value to it
    * def nineDayForecastURL = baseUrl
    #Set the mentioned URL to be tested for all scenarios in this feature file
    Given url nineDayForecastURL


  @API_001 @IOS @9day_forecast @status
  Scenario: Response status checking
    #Send a GET request
    When method GET
    #Assert response code 200 which is a successful response
    Then status 200

  @API_002 @IOS @9day_forecast
  Scenario: Extract relative humidity for the day after tomorrow
    #Send a GET request
    When method GET
    #Assert response code 200
    Then status 200
    #Define a variable and assign value of Day 2's date to it
    * def forecastDate = response.forecast_detail[1].forecast_date
    #Define a variable and assign value of Day 2's min. relative humidity to it
    * def MinRH = response.forecast_detail[1].min_rh
    #Define a variable and assign value of Day 2's max. relative humidity to it
    * def MaxRH = response.forecast_detail[1].max_rh
    #Print what we've extracted from the response json
    And print 'Humidity for the day after tomorrow (', forecastDate, ') is: ', MinRH, '% -', MaxRH,'%'
