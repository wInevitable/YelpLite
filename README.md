# YelpLite

A business review web application. Features geographically-linked directory search and a MapBox-based visual display, account creation and authorization, image uploading, a rating and review system, bootstrapped data, nested forms, and more. Inspired by Yelp.

Download the repository, bundle install, and start-up your local server to run the app at home. Or head over to <a href="http://www.yelplite.com">YelpLite</a> to try out the app in a live production environment.

Implemented primarily with Ruby and Rails. Some functionality in Backbone with the intention of fully porting the app over when time allows. All CSS written without the assistance of 3rd-party frameworks. User-authentication is self-written with the help of BCrypt and supplemented with Oauth via Facebook and Twitter. The application makes use of multiple Rails Gems and ties in to several 3rd-party APIs including the Yelp API for access to factual business seed data.

#TODO

- ~~Procure Domain Name~~
- ~~Align Apps with new Domain Name~~
- ~~Set up Pingdom/newRelic to monitor site~~
- Add Demo User sign in - second if needed
- Add Form Buttons - automatically fill in relevant forms
- Flash Messages - *Flash All the Things!* - Style and troubleshoot any bugs
- User Tour to walk through prominent features
- Add User notifications and ability to follow/message/friend other Users and follow Businesses - *Join Tables*
- User account authentication with email - *SendGrid*
- Build out Static Pages - *About, Contact, Etc.*
- Add short description to Home Page
  - 1-3 Sentences describing App
  - Helpful sentences along the way to guide the User
- Port full app over to Backbone - currently only Home Page is functional - and add a button to switch between
- JavaScript Pop-Ups when hovering over User and Business Names to display info
- Adjust Business Search Results
- Add feature to claim Businesses
- Business Neighborhoods via Geographic Location
- Association and Images Table to allow for multiple images per business and additions with Reviews
- Pusher/Twilio implementation
- Seed Data - FactoryGirl and Faker
  - Reviews & Businesses - increase amount, uniqueness
  - Monitor Business address for accuracy
- Custom Font/Styling
  - Fix image functionality
  - Increase size of Rating Images
  - Custom Logo
