## Objective

You will be given a data file. The first line of the data file will have a target price. The following lines contain a menu of dishes.

Write a program to read in the data file and find any combination of dishes that add up exactly to the target price specified on the first line of the data file. If there is no solution, your program should specify that there is no combination of dishes that will be equal in cost to the target price.

## Assumptions

There were a few assumptions made when this program was created. They are
- All price points are positive numbers (and can't be negative)
- Price points can be duplicated
- A user can order more than one of each item
- The shell used to execute this program is bash 

## How To

[This](https://tablexi-prod.s3.amazonaws.com/comfy/cms/files/files/000/000/007/original/menu.txt) data file was given as the default and can be found in the ```menus/menu_one.txt``` file. 
 
The first thing you will want to do is to clone the repository to your local machine. Open the terminal and type
```ruby
cd Desktop
$ git clone https://github.com/gsperka/dish-combination-calculator.git
cd dish-combination-calculator
```
Once inside the repository, you can then run one of two commands neccessary to execute this program properly.

- *I ran this program on my laptop computer and for some reason, received a permissions error. If this is the case, ```cd``` into the dish-combination-calculator repository and run:

```
chmod a+x ./bin/place_order
```

## Scenario One - The file already exists

Since menu-one.txt already exists, you can simply type

```
bin/place_order menus/menu_one.txt
```

inside the terminal. You should see the output return various possible combinations (if there are any)

```
"Combination 1 is: mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit"
"Combination 2 is: hot wings, hot wings, mixed fruit, sampler plate"
```

## Scenario Two - You are passing in new information for the first time

If you are entering in information as an argument, you will want to execute a different command. It's very important to note that it must follow the exact syntax. If you choose to use double quotes instead of single quotes, an error will be thrown.

Sample command:

```
bin/place_order $'$15.05\nmixed fruit,$2.15\nfrench fries,$2.75\nside salad,$3.35\nhot wings,$3.55\nmozzarella sticks,$4.20\nsampler plate,$5.80'
```

- You must place the '$' in front of your argument

## Run Tests

All tests are located in the ```spec/place_orders``` file. To run all tests, type the following command:

```ruby
cd spec
rspec
```

or to run a specific test:

```ruby
cd spec
rspec menu_spec.rb
```
