An app where an admin can assign points to users and users can redeem those points for rewards. In this variation, users are heros and points are stopped crimes. The stopped crimes can get redeemed for superpowers. Full functionality described below:

Production: https://fast-eyrie-23101.herokuapp.com/
****
Login: Impulse
password: password

Stopped Crimes

Stopped Crimes can be created ("assigned to a hero") and destroyed only by the admin
heros can see their total number of stopped crimes on their dashboard

SuperPowers

powers can be created, edited, updated, and destroyed only by the admin
the list of possible powers can be seen by regular heros

Redeeming Points

heros can redeem their points for a power
when heros redeem their stopped crimes, the crimes are NOT destroyed; instead, they are marked as "redeemed"
when a hero redeems crimes for a powers, the hero can see that power on their dashboard

Authentication and Authorization

heros need to log in to see their crimes and powers
heros can only see their own stopped crimes and powers-- they should not be able to visit another hero's page
heros cannot add stopped crimes to their account, nor can they create new powers to add to the list
a hero cannot redeem another hero's powers
admin can create a hero


Extensions:


Use HAML for views
TDD using RSpec instead of Test::Unit
