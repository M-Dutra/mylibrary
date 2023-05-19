# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version = 3.1.2

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# README



This README would normally document whatever steps are necessary to get the

application up and running.



Things you may want to cover:enter code here



 - Ruby version - `3.1.2`

 - Rails version - `7.0.2.3`

 - System dependencies
	 `bundle install`
	  `yarn install`

 - Configuration
		Image Upload - Cloudinary  - you need to create a .env file to store the key

 - Database
	PostgreSQL - psql (14.7)

 -  Database creation
	 `rails db:create`

 - Database initialization
	   `rails db:migrate`
	   `rails db:seed`

 - Launch  server
	Open a  **new tab**  in your terminal: `rails server`
	Open a  **second tab**  in your terminal: `yarn build --watch`
	Keep both tabs open. The server is running Open your browser and go to  `http://localhost:3000/`
