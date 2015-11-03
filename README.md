# Hinton
Hinton app provides restaurant information and reviews, also including favorite menu items

To-do list:

-add price tier ($$$) search/filtering option (and write/rewrite the JSON parsing code to handle that)

-some bugs when switching between address/genre/price filter mode... like the tableview not dismissing, et al.

-of the "website | menu | options" buttons, if any of those three aren't available, instead of just greying that option's text out, remove option completely from view

-tap today's hours to reveal a full list of the hours for each day that week

-make the $$$$ thing on the restaurant detail page grey out any dollar signs for a tier less than the max number of $ symbols
(meaning, if it's a 3 out of 4 $ price tier, show 4 dollar signs, but grey out the fourth one)

bonus: i started setting up an option that lets the user tap the restaurant's phone number to dial it with phone, but
phone number string needs to be formatted properly

====================================================================

Completed:

-Tapping the directions button sends user to Apple Maps and gives directions from user's location

-Removed purple line from map preview in restaurant detail view

-Started setting up feature that dialed restaurant number when tapped; number string needs to be formatted correctly (perhaps remove all non-digits?)

-Made restaurant hours display the correct day's hours

-Don't use XCode 7. Stick with version 6.4


