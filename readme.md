###Timeshare

####Dependencies

* MongoDB, on OSX 10.6 and later: `brew update` then `brew install mongodb`
* Mongo will by default write in a folder `/dat/db` and you will probably have to create it on your mac's root folder. (If you want to change the configuration http://docs.mongodb.org/manual/reference/configuration-options/)
* RVM  1.25.31 (stable) for Ruby and Genset management
* Ruby 2.1.3
* All other dependencies are set in the gemfile

####Test Mailer 

* To test the application email sent, I'm making use of MailCatcher: http://mailcatcher.me/
* The application is setup to send the emails on localhost:1025 used by mailcatcher to intercept all outgoing emails and show them into a catchall mailbox.
* To see the emails, open a browser on: http://localhost:1080/


####Installation

For development mode and test

* Checkout the application

####Start the MongoDB

* Open one terminal and type mongodb: `mongod`


####Development / tests

* cd to the application folder
* Open another terminal and start the server `rails s` (starts thin by default)
* Open abrowser and go to localhost:3000
* To run the test suite in a terminal type `rspec`