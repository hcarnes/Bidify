# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
Used Sinatra gem & used Sinatra route methods.
- [x] Use ActiveRecord for storing information in a database
Used ActiveRecord gem to generate and manage data.
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
Used 3 models: Bid, Listing, and User.
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
Bid belongs to user.
Bid belongs to listing.
Listing belong to user.
Listing has many bids.
User has many listings.
User has many bids.
- [x] Include user accounts
GET and POST methods included for signing up and logging in.
- [x] Ensure that users can't modify content created by other users
I enabled sessions and created the `sign_in` and `current_user` methods.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
Listings can be created, read, updated, and destroyed.
- [x] Include user input validations
Bid, Listing, and User include input validations.
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
Gem rack-flash3 was used to generate error messags for invalid user input.
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.
See READ.md

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message