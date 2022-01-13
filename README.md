# README

![rails-badge](https://img.shields.io/badge/Rails-5.2.6-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.7.2-informational?style=flat-square)

One of the most effective ways of preventing overuse is to make sure someone stays with you while you use a substance. This, however, is not always an option for everybody. This Rails App ([FE deployed endpoint](https://komodo-frontend.herokuapp.com)) ([BE deployed endpoint](https://komodo-backend.herokuapp.com)) was created in hopes of mitigating this issue. It lets a client create emergency contacts and start a timer when they are about to use a substance. If the timer is not stopped before it runs out, it will text their contacts with the client's address, map and other information pre-created by the client.    

#### What can I do on Komodo?
  - Sign up and sign in using Google OAuth 2.0
  - Create emergency contacts with their name and phone number
  - Create timers with information such as:
    - Duration in minutes (the only required information)
    - Substance
    - Dosage
    - Entry Instructions and other notes
  - Start a timer
  - Cancel the timer before it goes off

#### Stack
- Ruby on Rails, RSpec, Heroku, CircleCI, PostgreSQL, Sidekiq
- Some of the gems: redis, pry, simplecov, vcr, webmock

# Readme Content
- [Local Setup](#local-setup)
- [External APIs](#external-apis)
- [Test Suite](#test-suite)
- [Contributor](#contributor)

# Local Setup. SOMEBODY DO THE ADDITIONAL THE BE INSTRUCTION
- Versions
  - Rails 5.2.6
  - Ruby 2.7.2
- Fork and clone the ([FE Repository](https://github.com/Komodo-Turing/komodo_frontend)) and ([BE Repository](https://github.com/Komodo-Turing/komodo_backend))
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - This API uses a few [external APIs](#external-apis)
    - Add a local application.yml file at the root (this will be ignored in gitcoverage)
    - Sign up for a free Twilio account [Twilio](https://www.twilio.com/try-twilio?utm_source=google&utm_medium=cpc&utm_term=twilio%20api&utm_campaign=Sitelink_G_S_NAMER_Brand_Twilio&gclid=Cj0KCQiAuP-OBhDqARIsAD4XHpdjXfqb_rKxFVh1zws4KWvU-06VpAAedcfw1t7dt8GOtcpK1KpyXTUaApF2EALw_wcB)
    - Get an API key for [Mapquest](https://developer.mapquest.com/plan_purchase/steps/business_edition/business_edition_free/register) 
    - Add to your application.yml config: 
    ```
      mapquest_api_key: your_key_here
    ```
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - FrontEnd local server address is: "http://localhost:5000" 
  - BackEnd local server address is:  "http://localhost:3000" 

# External APIs
This API consumes the following APIs:
- [Twilio](https://www.twilio.com/docs/sms/api) to send text messages
- [MapQuest Geocoding API](https://developer.mapquest.com/documentation/geocoding-api/) to provide map image

# Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- XX% test coverage for the FrontEnd
- XX% test coverage for the BackEnd

# Contributor
- Jacob Yarborough |  [Github](https://github.com/jacobyarborough)
- Haewon Jeon      |  [Github](https://github.com/haewonito)
- Matt Holmes      |  [Github](https://github.com/matthewjholmes)
- Stephanie Helm   |  [Github](https://github.com/stephaniemhelm)
- Micha Bernhard   |  [Github](https://github.com/michab17)

