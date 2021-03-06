Feature: Command Line Interface
  In order to order an exact amount worth of appetizers
  As a user
  I want use the program on the command line

  @slow
  Scenario: show options
    Given the input:
      """
      $15.05
      mixed fruit,$2.15
      french fries,$2.75
      side salad,$3.35
      hot wings,$3.55
      mozzarella sticks,$4.20
      sampler plate,$5.80
      """
    When I start a program
    Then the summary should include "Combination 1 is: mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit Combination 2 is: hot wings, hot wings, mixed fruit, sampler plate"

  Scenario: no combination of dishes
    Given the input:
      """
      $3.00
      mixed fruit,$2.15
      french fries,$2.75
      """
    When I start a program
    Then the summary should include "No combination of dishes!"
