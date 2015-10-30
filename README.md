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
