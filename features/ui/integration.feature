Feature: Integration test
  In order to order an exact amount worth of appetizers
  As a user
  I want to see the walk through of a complete program

  @slow
  Scenario: via stdin
    Given I run `bin/place_order '$15.05\nmixed fruit,$2.15\nfrench fries,$2.75\nside salad,$3.35\nhot wings,$3.55\nmozzarella sticks,$4.20\nsampler plate,$5.80'`
    Then the stdout should contain exactly:
      """
      Combination 1 is: mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit
      Combination 2 is: hot wings, hot wings, mixed fruit, sampler plate

      """

  Scenario: via stdin and no combinations
    Given I run `bin/place_order '$1.00\nmixed fruit,$2.15\nfrench fries,$2.75'`
    Then the stdout should contain exactly:
      """
      No combination of dishes!

      """
